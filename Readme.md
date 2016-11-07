
# Exercise 1.1

1) Create a Dynamic controller and a Person class alongside
2) Return a content result with the first name and last name

# Exercise 2 - List employees

1) Create a page to list employees, First name, last name, title and office

# Exercise 3 - Edit employees

1) Edit employees - first/last name, title, office, email and phone number

# Exercise 4 - Filter for transactions

1) Create async transaction filter to begin/commit/rollback transaction
2) Remove save changes in controllers
3) Modify AddMvc method to add the filter
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

Exercise 5

1) Add AutoMapper