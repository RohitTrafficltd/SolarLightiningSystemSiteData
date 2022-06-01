using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;
using RestSharp;
using SolarSiteData.Model;
using Npgsql;

namespace SolarSiteData
{
    class Program
    {
        static void Main(string[] args)
        {

            List<string> siteIdList = new List<string>(){ "66122","65609","224574","52687","51153","64004","69056","66288","67258","67255","69050","55271","71382","64440","225021","67118",
                "158425","68311","65607","67257","49679","158604","63996","69053","65608","161975","52720","69055","54311","68309","310509","49681","224871","224638","66289","71391","64086",
                "64105","51156","165089","67116","67117","64101","71385","71390","64106","64094","68310","66123","73378","64091","160166","68308","68671","50437"};

            foreach (var id in siteIdList)
            {
                getSiteData(id);
            }

           
        }

        private static void getSiteData(string siteId)
        {
            string token = getToken();

            StringBuilder url = new StringBuilder();
            url.Append("https://portal.solaranalytics.com.au/api/v2/site_data/");
            url.Append(siteId);
            url.Append("?tstart=");
            url.Append(DateTime.Now.AddDays(-1).ToString("yyyy/MM/dd"));
            url.Append("&tend =");
            url.Append(DateTime.Now.ToString("yyyy/MM/dd"));
            url.Append("&gran=day&raw=true&trunc=true");

            //https://portal.solaranalytics.com.au/api/v2/site_data/54311?tstart=20220523&tend=20220524&gran=day&raw=true&trunc=true

            var client = new RestClient(url.ToString());
            client.Timeout = -1;

            var request = new RestRequest(Method.GET);
            StringBuilder header = new StringBuilder();
            header.Append("Bearer ");
            header.Append(token);
            request.AddHeader("Authorization", header.ToString());
            IRestResponse response = client.Execute(request);

            Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(response.Content);

            foreach (var siteData in myDeserializedClass.data)
            {
                SaveToDatabase(siteId, siteData);
            }
        }

        private static void SaveToDatabase(string siteId, Datum siteData)
        {
            foreach (var data in siteData.data)
            {
                WriteToDataBase(siteId, siteData, data);
            }
        }

        private static void WriteToDataBase(string siteId, Datum siteData, Datum data)
        {
            var cs = "Host=vaslogdbserver.cmskisd0znzz.ap-southeast-2.rds.amazonaws.com;Username=VasLogDev;Password=VasLogDev#1;Database=VASLogDb";

            using var con = new NpgsqlConnection(cs);
            con.Open();



            var sql = ($"INSERT INTO SolarSystemSiteData (siteId,data_circuit,data_circuit_name,data_data_apparentPower,data_data_current,data_data_energy,data_data_energyNeg,data_data_energyPos,data_data_power,data_data_powerFactor,data_data_reactiveEnergy,data_data_reactivePower,data_data_time,data_data_voltage,data_monitors,data_pk,data_polarity,data_watt_device_id) VALUES('{siteId}','{siteData.circuit}','{siteData.circuit_name}','{data.apparentPower}','{data.current}','{data.energy}','{data.energyNeg}','{data.energyPos}','{data.power}','{data.powerFactor}','{data.reactiveEnergy}','{data.reactivePower}','{UnixTimeStampToDateTime(data.time.ToString())}','{data.voltage}','{siteData.monitors}','{siteData.pk}'," +
                $"'{siteData.polarity}','{siteData.watt_device_id}')");


            using var cmd = new NpgsqlCommand();
            cmd.Connection = con;

            cmd.CommandText = sql;
            object p = cmd.ExecuteNonQuery();
        }

        public static string UnixTimeStampToDateTime(string unixTimeStamp)
        {
            double unixTime = Convert.ToDouble(unixTimeStamp.Substring(0, 10));
            DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            dtDateTime = dtDateTime.AddSeconds(unixTime).ToLocalTime();
            /*if(DateTime.Now.ToString().Contains("PM"))
                {
                dtDateTime = dtDateTime.AddHours(12);
                }*/
            return dtDateTime.ToString("yyyy-MM-dd HH:mm:ss");
        }

        private static string getToken()
        {
            var client = new RestClient("https://portal.solaranalytics.com.au/api/v3/token");
            client.Timeout = -1;
            var request = new RestRequest(Method.GET);
            request.AddHeader("Authorization", "Basic bXBhdmxvdmljaEBzYWxpc2J1cnkuc2EuZ292LmF1OldlbGNvbWUwMQ==");
            IRestResponse response = client.Execute(request);
            //Console.WriteLine(response.Content);
            return response.Content.Split("\"token\"")[1].Split(":")[1].Split("}")[0].Replace('"', ' ');
        }
    }
}
