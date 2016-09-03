using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Ormer_PHC.Startup))]
namespace Ormer_PHC
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
