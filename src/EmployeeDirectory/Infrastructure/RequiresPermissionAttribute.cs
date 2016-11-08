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

    public class RequirePermissionAttribute : Attribute, IAsyncAuthorizationFilter
    {
        public Permission Permission { get; }

        public RequirePermissionAttribute(Permission permission)
        {
            Permission = permission;
        }
        public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {
            var dbContext = context.HttpContext.RequestServices.GetService<DirectoryContext>();
            var hasPermission = await dbContext.EmployeeRoles
                .Where(er => er.Employee.Username == context.HttpContext.User.Identity.Name)
                .Where(er => er.Role.RolePermissions.Any(rp => rp.Permission == Permission))
                .AnyAsync();

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
