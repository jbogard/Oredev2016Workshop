namespace EmployeeDirectory.Infrastructure
{
    using System;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc.Filters;

    public class DbContextTransactionFilter : IAsyncActionFilter
    {
        private readonly DirectoryContext _dbContext;

        public DbContextTransactionFilter(
            DirectoryContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task OnActionExecutionAsync(
            ActionExecutingContext context, 
            ActionExecutionDelegate next)
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
}