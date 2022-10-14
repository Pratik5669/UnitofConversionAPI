using ConversionDTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace ConversionBAL
{
    public interface IConversionBL
    {
        public List<ConversionDetails> GetConversionDetails(int metricUnit, int impericalUnit, int inputValue, int conversionType);
    }
}
