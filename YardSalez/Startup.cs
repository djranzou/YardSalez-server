using Microsoft.Owin;
using Microsoft.Owin.Security.OAuth;
using Owin;
using System;
using System.Web.Http;
using YardSalez.DependencyResolution;
using YardSalez.Infrastructure;

[assembly: OwinStartup(typeof(YardSalez.Startup))]
namespace YardSalez
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureOAuth(app);
            var container = IoC.Initialize();
            var configuration = new HttpConfiguration
            {
                DependencyResolver = new StructureMapWebApiDependencyResolver(container)
            };
            WebApiConfig.Register(configuration);
            app.UseWebApi(configuration);
        }

        private void ConfigureOAuth(IAppBuilder app)
        {
            var OAuthServerOptions = new OAuthAuthorizationServerOptions()
            {
                AllowInsecureHttp = true,
                TokenEndpointPath = new PathString("/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromDays(1),
                Provider = new AuthorizationServerProvider()
            };

            // Token Generation
            app.UseOAuthAuthorizationServer(OAuthServerOptions);
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
        }
    }
}
