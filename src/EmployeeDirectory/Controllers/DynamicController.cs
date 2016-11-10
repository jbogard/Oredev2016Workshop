using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeDirectory.Controllers
{
    public class Person
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }

    public class DynamicController : Controller
    {
        // GET: /<controller>/
        public IActionResult Index(Person person, Person person2)
        {
            return Content($"Hello {person.FirstName} {person.LastName} and {person2.FirstName}");
        }
    }
}
