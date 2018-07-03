namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using Web.Data;

    /// <summary>
    /// Statistic Models
    /// </summary>
    public class StatisticModels
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="StatisticModels"/> class.
        /// </summary>
        public StatisticModels()
        {
        }

        /// <summary>
        /// Lists all.
        /// </summary>
        /// <returns>List All</returns>
        public static List<C_Statistic> ListAll()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.f_Statistic_All().Where(p => (int.Parse(p.year) <= DateTime.Now.Year) && (int.Parse(p.year) >= DateTime.Now.AddYears(-2).Year)).OrderByDescending(p => int.Parse(p.year)).ThenByDescending(p => int.Parse(p.month)).Take(12).ToList<f_Statistic_All_Result>();
                    List<C_Statistic> list_Statistic = new List<C_Statistic>();
                    foreach (var it in c_gen)
                    {
                        C_Statistic c = new C_Statistic();
                        ////c.ThoiGian = DateTime.Parse(it.date);
                        c.SoTruyCap = long.Parse(it.Total.ToString());
                        c.year = int.Parse(it.year);
                        c.month = int.Parse(it.month);

                        list_Statistic.Add(c);
                    }

                    return list_Statistic;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        /// <summary>
        /// Statistics the table.
        /// </summary>
        /// <returns>Statistic Table</returns>
        public DataTable StatisticTable()
        {
            using (var data = new Entities())
            {
                var entityList = data.f_ThongKe_Edit().ToList<f_ThongKe_Edit_Result>();
                var properties = typeof(f_ThongKe_Edit_Result).GetProperties();
                var table = new DataTable();

                foreach (var property in properties)
                {
                    var type = Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;
                    table.Columns.Add(property.Name, type);
                }

                foreach (var entity in entityList)
                {
                    table.Rows.Add(properties.Select(p => p.GetValue(entity, null)).ToArray());
                }

                return table;
            }
        }

        /// <summary>
        /// Statistics the result.
        /// </summary>
        /// <returns>Statistics the result</returns>
        public List<f_ThongKe_Edit_Result> StatisticsResult()
        {
            using (var data = new Entities())
            {
                try
                {
                    var c_gen = data.f_ThongKe_Edit().ToList<f_ThongKe_Edit_Result>();
                    return c_gen;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}