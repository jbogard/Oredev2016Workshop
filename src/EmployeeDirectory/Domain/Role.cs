namespace EmployeeDirectory.Domain
{
    using System.Collections.Generic;

    public class Role : Entity
    {
        public string Name { get; set; }

        public ICollection<RolePermission> RolePermissions { get; set; }
    }
}