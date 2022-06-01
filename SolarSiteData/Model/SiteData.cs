using System;
using System.Collections.Generic;

namespace SolarSiteData.Model
{
    public class Datum
    {
        public int circuit { get; set; }
        public string circuit_name { get; set; }
        public List<Datum> data { get; set; }
        public string monitors { get; set; }
        public int pk { get; set; }
        public int polarity { get; set; }
        public string watt_device_id { get; set; }
        public double apparentPower { get; set; }
        public double current { get; set; }
        public double energy { get; set; }
        public double energyNeg { get; set; }
        public double energyPos { get; set; }
        public double power { get; set; }
        public double powerFactor { get; set; }
        public double reactiveEnergy { get; set; }
        public double reactivePower { get; set; }
        public int time { get; set; }
        public double voltage { get; set; }
    }

    public class Root
    {
        public List<Datum> data { get; set; }
    }
}
