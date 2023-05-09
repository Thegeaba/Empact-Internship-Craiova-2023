using EMPACT___WEB_API.Context;
using Microsoft.AspNetCore.Mvc;
using System.Xml.Linq;

namespace EMPACT___WEB_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NewsController : ControllerBase
    {
        private const string FeedUrl = "https://rss.nytimes.com/services/xml/rss/nyt/World.xml";
        private NewsContext context;

        public NewsController(NewsContext context)
        {
            this.context = context;
        }

        [HttpGet]
        [Route("GetNews")]
        public IActionResult GetNews([FromQuery] string sortBy = "date", [FromQuery] string sortOrder = "asc", [FromQuery] string? search = null)
        {
            // Preiau datele din RSS
            XDocument feedXml;
            using (var httpClient = new HttpClient())
            {
                feedXml = XDocument.Load(httpClient.GetStreamAsync(FeedUrl).Result);
            }

            // Parse the feed into NewsItem objects
            var newsItems = feedXml.Descendants("item").Select(x => new NewsItem
            {
                Title = x.Element("title")?.Value,
                Link = x.Element("link")?.Value,
                Description = x.Element("description")?.Value,
                PublicationDate = DateTime.TryParse(x.Element("pubDate")?.Value, out var publicationDate)
                    ? publicationDate : default
            });

            // Filter the news items by search query
            if (!string.IsNullOrEmpty(search))
            {
                newsItems = newsItems.Where(x => x.Title.Contains(search, StringComparison.OrdinalIgnoreCase) || Convert.ToString(x.PublicationDate).Contains(search, StringComparison.OrdinalIgnoreCase));
            }

            // Sortez dupa title/date asc/desc
            if (sortBy == "title")
            {
                if (sortOrder == "asc")
                {
                    newsItems = newsItems.OrderBy(x => x.Title);
                }
                else if (sortOrder == "desc")
                {
                    newsItems = newsItems.OrderByDescending(x => x.Title);
                }
                else
                {
                    return BadRequest("You can use only asc/desc in sortOrder");
                }
            }
            else if (sortBy == "date")
            {
                if (sortOrder == "asc")
                {
                    newsItems = newsItems.OrderBy(x => x.PublicationDate);
                }
                else if (sortOrder == "desc")
                {
                    newsItems = newsItems.OrderByDescending(x => x.PublicationDate);
                }
                else
                {
                    return BadRequest("You can use only asc/desc in sortOrder");
                }
            }
            else
            {
                return BadRequest("You can use only title/date in sortBy");
            }

            return Ok(newsItems);
        }

        [HttpGet]
        [Route("AddNews")]
        public IActionResult AddToDatabase()
        {
            XDocument feedXml;
            using (var httpClient = new HttpClient())
            {
                feedXml = XDocument.Load(httpClient.GetStreamAsync(FeedUrl).Result);
            }

            // Parse the feed into NewsItem objects
            var newsItems = feedXml.Descendants("item").Select(x => new NewsItem
            {
                Title = x.Element("title")?.Value,
                Link = x.Element("link")?.Value,
                Description = x.Element("description")?.Value,
                PublicationDate = DateTime.TryParse(x.Element("pubDate")?.Value, out var publicationDate)
                    ? publicationDate : default
            });
            context.News_Table.AddRange(newsItems);
            context.SaveChanges();

            return Ok();

        }

        [HttpGet]
        [Route("GetFromDB")]

        public IActionResult GetFromDB()
        {
            var news = context.News_Table.ToList();
            return Ok(news);
        }
    }



    public class NewsItem
    {
        public int Id { get; set; } = new Random().Next();
        public string Title { get; set; }
        public string Link { get; set; }
        public string Description { get; set; }
        public DateTime PublicationDate { get; set; }
    }
}
