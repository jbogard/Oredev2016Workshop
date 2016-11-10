using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace EmployeeDirectory.Controllers
{
    using System.Data.Entity;
    using AutoMapper;
    using AutoMapper.QueryableExtensions;
    using Domain;
    using Infrastructure;
    using Microsoft.AspNetCore.Authorization;
    using ViewModels;

    public class EmployeeController : Controller
    {
        private readonly DirectoryContext _db;
        private readonly IMapper _mapper;

        public EmployeeController(
            DirectoryContext db,
            IMapper mapper
            )
        {
            _db = db;
            _mapper = mapper;
        }
        // GET: /<controller>/
        public async Task<IActionResult> Index()
        {
            var employees = await _db.Employees
                .ProjectToListAsync<EmployeeIndexModel>();

            return View(employees);
        }

        [RequirePermission(Permission.EditEmployees)]
        public async Task<IActionResult> Edit(Guid id)
        {
            var employee = await _db.Employees
                .Where(e => e.Id == id)
                .ProjectToSingleOrDefaultAsync<EmployeeEditModel>();

            return View(employee);
        }

        [HttpPost]
        [RequirePermission(Permission.EditEmployees)]
        public async Task<IActionResult> Edit(
            EmployeeEditModel model)
        {
            var employee = await _db.Employees
                .FindAsync(model.Id);

            _mapper.Map(model, employee);

            return RedirectToAction(nameof(Index));
        }
    }
}
