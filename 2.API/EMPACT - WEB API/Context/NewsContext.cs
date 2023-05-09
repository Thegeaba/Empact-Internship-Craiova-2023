using EMPACT___WEB_API.Controllers;
using Microsoft.EntityFrameworkCore;

namespace EMPACT___WEB_API.Context
{
    public class NewsContext : DbContext
    {
        public NewsContext(DbContextOptions<NewsContext> options)
            : base(options)
        {
        }
        public DbSet<NewsItem> News_Table => Set<NewsItem>();
    }
}
