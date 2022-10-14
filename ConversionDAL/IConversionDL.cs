using ConversionDTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace ConversionDAL
{
    public interface IConversionDL
    {
        List<ConversionDetails> GetConversionDetails(int metricUnit, int impericalUnit, int inputValue, int conversionType);
    }
}
