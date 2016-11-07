namespace EmployeeDirectory.Domain
{
    using System.Collections.Generic;

    public class Employee : Entity
    {
        public string Username { get; set; }
        public string HashedPassword { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Title { get; set; }
        public Office Office { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }

        public ICollection<EmployeeRole> EmployeeRoles { get; set; }

    }
}