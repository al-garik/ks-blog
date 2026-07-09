# R-Bloggers Syndication Guide

This blog is configured for syndication on [R-Bloggers](https://www.r-bloggers.com), the largest aggregator of R content.

## Quick Setup

### 1. Submit Your Blog to R-Bloggers

Visit: https://www.r-bloggers.com/add-your-blog/

Fill in:
- **Blog URL**: `https://yourdomain.com/ks-blog` (your blog homepage)
- **Blog RSS Feed**: `https://yourdomain.com/ks-blog/index.xml` (main feed with all posts)
- **R-Specific Feed** (optional): `https://yourdomain.com/ks-blog/r-bloggers.xml` (only R posts)

### 2. R-Bloggers Requirements

✅ **Content Requirements:**
- Posts must be R-related (contain R code, discuss R packages, or R implementations)
- Statistical/programming posts without R don't qualify
- Include the word "R" or R code in your posts

✅ **Technical Requirements:**
- Valid RSS feed with post titles, descriptions, dates, and links
- Posts should have a description (metadata)
- Back-link to R-Bloggers recommended (included in post template)

## Tagging Posts for R-Bloggers

### How to Include a Post

Add **"R"** to the `categories` field in your post's YAML frontmatter:

```yaml
---
title: "Getting Started with ksTFL"
author: "KeyStat Solutions"
date: 2026-07-06
categories: [R, ksTFL, Clinical Programming]  # ← "R" tag required
---
```

### How to Exclude a Post

Simply **don't include "R"** in categories:

```yaml
---
title: "Company Announcement"
categories: [Meta, News]  # ← No "R" = won't appear in R-Bloggers feed
---
```

## RSS Feeds

This blog provides **two RSS feeds**:

### 1. **Main Feed** (All Posts)
- URL: `index.xml`
- Contains all published posts
- Use for regular blog subscribers

### 2. **R-Bloggers Feed** (R Posts Only)
- URL: `r-bloggers.xml`
- Contains only posts tagged with `categories: [R, ...]`
- Use for R-Bloggers subscription
- Generated from `r-bloggers.qmd`

## Best Practices for R-Bloggers

### 1. Always Include "R" in Categories
```yaml
categories: [R, Topic1, Topic2]  # Good ✅
categories: [ksTFL, Statistics]   # Bad ✗ (won't be syndicated)
```

### 2. Write Clear Descriptions
- Keep descriptions under 160 characters
- Make them compelling and descriptive
- Good example: "A step-by-step guide to creating clinical tables with the ksTFL R package"

### 3. Add R-Bloggers Attribution
End your R posts with:
```markdown
---

*This post was originally published on the KeyStat Solutions R Technical Blog. 
[Visit R-Bloggers](https://www.r-bloggers.com) to discover more R content.*
```

### 4. Include Code Examples
R-Bloggers readers appreciate:
- Executable R code blocks
- Reproducible examples
- Real-world use cases

### 5. Link Strategy
- Link back to R-Bloggers (builds community)
- Link to your package documentation
- Link to related posts on your blog

## Monitoring Your Posts

After submission to R-Bloggers:

1. **First Post Approval**: Tal Galili (R-Bloggers founder) reviews your blog
2. **Automatic Syndication**: Once approved, new R-tagged posts automatically appear
3. **Visibility**: Your posts appear on R-Bloggers main page when published
4. **Backlinks**: R-Bloggers provides backlinks to your site

## Checking Your Posts

To verify posts are in the R-specific feed:

1. Check the rendered `r-bloggers.xml` file in `docs/`
2. Verify only posts with "R" category appear
3. Check RSS reader to confirm feed validity

## FAQ

**Q: How often are posts updated on R-Bloggers?**  
A: R-Bloggers checks feeds periodically (usually within hours of publishing)

**Q: Can I submit old posts?**  
A: Only recent posts will be syndicated. R-Bloggers focuses on new content.

**Q: Do I get traffic from R-Bloggers?**  
A: Yes! R-Bloggers has a large audience of R users who click through to read full posts.

**Q: What if I delete a post?**  
A: It will remain in R-Bloggers history but marked as archived.

**Q: Can I have multiple feeds?**  
A: Yes, you can submit both `index.xml` (all posts) and `r-bloggers.xml` (R only) to different services.

## Support

For questions about:
- **Your blog**: See README.md and _CUSTOMIZATION_GUIDE.qmd
- **R-Bloggers**: Visit https://www.r-bloggers.com/contact-us/
- **Submission issues**: Check R-Bloggers submission page

---

Happy blogging! 🎉
