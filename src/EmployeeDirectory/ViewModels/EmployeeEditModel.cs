namespace EmployeeDirectory.ViewModels
{
    using System;
    using Domain;
    using System.ComponentModel.DataAnnotations;

    public class EmployeeEditModel
    {
        public Guid Id { get; set; }

        [Display(Name = "First Name")]
        public string FirstName { get; set; }
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
        public string Title { get; set; }
        public Office Office { get; set; }
        public string Email { get; set; }
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }
}