namespace ApiBase.Models.BusinessAccess
{
    using ApiBase.Models.DB;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;

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
        public static List<Statistic> ListAll()
        {
            using (var data = new themanorContext())
            {
                try
                {
                    var c_gen = data.Statistic.FromSql("EXECUTE _Statistic_All").Where(p => ((p.Year ?? 0) <= DateTime.Now.Year) && ((p.Year ?? 0) >= DateTime.Now.AddYears(-2).Year)).OrderByDescending(p => (p.Year ?? 0)).ThenByDescending(p => (p.Month??0)).Take(12).ToList(); ;

                    //var c_gen = data.f_Statistic_All().Where(p => (int.Parse(p.year) <= DateTime.Now.Year) && (int.Parse(p.year) >= DateTime.Now.AddYears(-2).Year)).OrderByDescending(p => int.Parse(p.year)).ThenByDescending(p => int.Parse(p.month)).Take(12).ToList<f_Statistic_All_Result>();
                    List<Statistic> list_Statistic = new List<Statistic>();
                    foreach (var it in c_gen)
                    {
                        Statistic c = new Statistic();
                        ////c.ThoiGian = DateTime.Parse(it.date);
                        c.SoTruyCap = long.Parse(it.Total.ToString());
                        c.Year = it.Year;
                        c.Month = it.Month;

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

        ///// <summary>
        ///// Statistics the table.
        ///// </summary>
        ///// <returns>Statistic Table</returns>
        //public DataTable StatisticTable()
        //{
        //    using (var data = new themanorContext())
        //    {
        //        var entityList = data.f_ThongKe_Edit().ToList<f_ThongKe_Edit_Result>();
        //        var properties = typeof(f_ThongKe_Edit_Result).GetProperties();
        //        var table = new DataTable();

        //        foreach (var property in properties)
        //        {
        //            var type = Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType;
        //            table.Columns.Add(property.Name, type);
        //        }

        //        foreach (var entity in entityList)
        //        {
        //            table.Rows.Add(properties.Select(p => p.GetValue(entity, null)).ToArray());
        //        }

        //        return table;
        //    }
        //}

        ///// <summary>
        ///// Statistics the result.
        ///// </summary>
        ///// <returns>Statistics the result</returns>
        //public List<f_ThongKe_Edit_Result> StatisticsResult()
        //{
        //    using (var data = new themanorContext())
        //    {
        //        try
        //        {
        //            var c_gen = data.f_ThongKe_Edit().ToList<f_ThongKe_Edit_Result>();
        //            return c_gen;
        //        }
        //        catch (Exception)
        //        {
        //            return null;
        //        }
        //    }
        //}
    }
}