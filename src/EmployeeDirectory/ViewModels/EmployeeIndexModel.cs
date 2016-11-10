namespace EmployeeDirectory.ViewModels
{
    using System;
    using Domain;

    public class EmployeeIndexModel
    {
        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string Title { get; set; }
        public Office Office { get; set; }
    }
}