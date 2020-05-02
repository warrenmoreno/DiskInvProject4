using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DiskInvBk03Project02.Startup))]
namespace DiskInvBk03Project02
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
