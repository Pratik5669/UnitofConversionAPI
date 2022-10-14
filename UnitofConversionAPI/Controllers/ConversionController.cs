using ConversionBAL;
using ConversionDTO;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace UnitofConversionAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConversionController : ControllerBase
    {
        private readonly IConversionBL conversionBL;
        public ConversionController(IConversionBL _conversionBL) 
        {
            conversionBL = _conversionBL;   
        }
        public ConversionDetails ConversionDetails(int metricUnit, int impericalUnit, int inputValue, int conversionType)
        {
            return conversionBL.GetConversionDetails(metricUnit,impericalUnit,inputValue,conversionType).First();
        }
    }
}
