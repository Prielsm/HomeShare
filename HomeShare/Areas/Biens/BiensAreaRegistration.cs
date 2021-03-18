using System.Web.Mvc;

namespace HomeShare.Areas.Biens
{
    public class BiensAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Biens";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Biens_default",
                "Biens/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}