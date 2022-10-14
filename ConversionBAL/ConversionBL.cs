using ConversionDAL;
using ConversionDTO;
using System;
using System.Collections.Generic;

namespace ConversionBAL
{
    public class ConversionBL : IConversionBL
    {
        private readonly IConversionDL  conversionDL ;
        public ConversionBL(IConversionDL _conversionDL)
        { 
           conversionDL = _conversionDL;
        }
        public List<ConversionDetails> GetConversionDetails(int metricUnit, int impericalUnit, int inputValue, int conversionType)
        {
            return conversionDL.GetConversionDetails(metricUnit,impericalUnit,inputValue,conversionType);
        }
    }
}
