namespace EmployeeDirectory.Infrastructure
{
    using System;
    using Microsoft.AspNetCore.Mvc.Filters;
    using System.Data.Entity;
    using System.Linq;
    using System.Threading.Tasks;
    using Domain;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.DependencyInjection;

    public class RequirePermissionAttribute 
        : Attribute, IAsyncAuthorizationFilter
    {
        public Permission Permission { get; }

        public RequirePermissionAttribute(Permission permission)
        {
            Permission = permission;
        }
        public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {
            var authorizer = context
                .HttpContext
                .RequestServices
                .GetService<IPermissionAuthorizer>();

            var username = context.HttpContext.User.Identity.Name;

            var hasPermission = await authorizer.HasPermission(username, Permission);

            if (!hasPermission)
            {
                context.Result = new ContentResult
                {
                    Content = "You don't have access!!",
                };
            }
        }
    }

}
