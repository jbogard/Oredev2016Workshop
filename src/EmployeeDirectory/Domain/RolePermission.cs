namespace EmployeeDirectory.Domain
{
    public class RolePermission : Entity
    {
        public virtual Role Role { get; set; }
        public Permission Permission { get; set; }
    }
}