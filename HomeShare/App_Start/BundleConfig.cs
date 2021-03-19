using System.Web;
using System.Web.Optimization;

namespace HomeShare
{
    public class BundleConfig
    {
        // Pour plus d'informations sur le regroupement, visitez https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/scripts").Include(
                        "~/js/script.js"));

            bundles.Add(new ScriptBundle("~/bundles/biblio").Include(
                        "~/Scripts/jquery-1.9.1.min.js",
                        "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/carousel").Include(
                        "~/Scripts/owl.carousel.js"));

            bundles.Add(new ScriptBundle("~/bundles/slider").Include(
                        "~/js/jquery.ba-cond.min.js",
                        "~/js/modernizr.custom.79639.js",
                        "~/js/jquery.slitslider.js"));



            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/css/style.css"));

            bundles.Add(new StyleBundle("~/Content/carousel").Include(
                      "~/Content/OwlCarousel/owl.carousel.css",
                      "~/Content/OwlCarousel/owl.theme.css"));

            bundles.Add(new StyleBundle("~/Content/slider").Include(
                      "~/css/style-slitslider.css",
                      "~/css/custom-slitslider.css"));

            bundles.Add(new StyleBundle("~/Content/profil").Include(
                      "~/css/profil.css"));

        }
    }
}
