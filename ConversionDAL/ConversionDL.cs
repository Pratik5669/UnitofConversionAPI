using ConversionDTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ConversionDAL
{
    public class ConversionDL :IConversionDL
    {

        private static IOptions<DbSetting> app;
        public ConversionDL(IOptions<DbSetting> appsetting)
        {
            app = appsetting;
        }
        SqlConnection con = new SqlConnection(app.Value.SqlConnection.ToString());

        public List<ConversionDetails> GetConversionDetails(int metricUnit, int impericalUnit, int inputValue, int conversionType)
        {

            List<ConversionDetails> results = new List<ConversionDetails>();
            using (con)
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"UnitConversion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MetericUnitType", metricUnit);
                    cmd.Parameters.AddWithValue("@ImperialUnitType", impericalUnit); 
                    cmd.Parameters.AddWithValue("@InputValue", inputValue); 
                    cmd.Parameters.AddWithValue("@ConversionType", conversionType);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ConversionDetails conversionDetails = new ConversionDetails();
                            conversionDetails.DataValue = Convert.ToDecimal(reader["DataValue"]);
                            conversionDetails.ImpericalUnit = Convert.ToString(reader["ImpericalUnit"]);
                            conversionDetails.MetricUnit = Convert.ToString(reader["MetricUnit"]);
                            conversionDetails.ConversionMessage = Convert.ToString(reader["ConversionMessage"]);
                            results.Add(conversionDetails);
                        }
                    }
                }
            }
            return results;
        }
    }
}
