using Microsoft.AspNet.Identity.EntityFramework;

namespace YardSalez.Data
{
    public class AuthContext : IdentityDbContext<IdentityUser>
    {
        public AuthContext()
            : base("AuthContext"){}
    }
}