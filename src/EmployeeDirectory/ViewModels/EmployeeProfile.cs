namespace EmployeeDirectory.ViewModels
{
    using AutoMapper;
    using Domain;

    public class EmployeeProfile : Profile
    {
        public EmployeeProfile()
        {
            CreateMap<Employee, EmployeeIndexModel>();

            CreateMap<Employee, EmployeeEditModel>()
                .ReverseMap(); // USE AT YOUR OWN RISK

        }
    }
}