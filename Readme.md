Slides and exercises for the Oredev ASP.NET MVC Core workshop

# Exercise 1 - simple controller

- Create a controller and a Person class alongside
- Return a content result with the first name and last name

# Exercise 2 - List employees

Create a page to list employees, First name, last name, title and office

# Exercise 3 - Edit employees

Edit employees - first/last name, title, office, email and phone number

# Exercise 4 - Filter for transactions

- Create async transaction filter to begin/commit/rollback transaction
- Remove save changes in controllers
- Modify AddMvc method to add the filter
```
    public class DbContextTransactionFilter : IAsyncActionFilter
    {
        private readonly SchoolContext _dbContext;

        public DbContextTransactionFilter(SchoolContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            try
            {
                _dbContext.BeginTransaction();

                await next();

                await _dbContext.CommitTransactionAsync();
            }
            catch (Exception)
            {
                _dbContext.RollbackTransaction();
                throw;
            }
        }
    }

```

# Exercise 4.2 - Dependency Injection

- Move the permission authorization into an IPermissionAuthorizer implementation

# Exercise 5 - AutoMapper

- Add AutoMapper

# Exercise 6 - Tag Helpers

- Create SecureTagHelper and modify links

```
namespace EmployeeDirectory.TagHelpers
{
    using System.Threading.Tasks;
    using Domain;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
    using Microsoft.AspNetCore.Razor.TagHelpers;
    using Services;

    [HtmlTargetElement(Attributes = PermissionAttributeName)]
    public class SecureTagHelper : TagHelper
    {
        private readonly IPermissionAuthorizer _authorizer;
        private const string PermissionAttributeName = "asp-permission";

        [HtmlAttributeNotBound]
        [ViewContext]
        public ViewContext ViewContext { get; set; }

        [HtmlAttributeName(PermissionAttributeName)]
        public Permission Permission { get; set; }

        public SecureTagHelper(IPermissionAuthorizer authorizer) 
        {
            _authorizer = authorizer;
        }

        public override async Task ProcessAsync(TagHelperContext context, TagHelperOutput output)
        {
            var username = ViewContext.HttpContext.User.Identity.Name;

            if (!await _authorizer.HasPermission(username, Permission))
            {
                output.SuppressOutput();
            }
        }
    }
}
```