namespace EmployeeDirectory.Domain
{
    using System;

    public abstract class Entity
    {
        public Guid Id { get; set; }
    }
}