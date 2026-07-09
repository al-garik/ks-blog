# Blog Writing Guide

This guide provides best practices for writing posts on the KeyStat Solutions blog.

## Voice and Tone

- **Professional but approachable**: Write for colleagues, not academics
- **Clear and concise**: Prefer short sentences
- **Practical**: Focus on "how-to" over theory
- **Helpful**: Assume readers want to learn and apply knowledge

### Good Examples

❌ "The utilization of vectorized operations within the R computing environment facilitates significant computational efficiency improvements."

✅ "Use vectorized operations in R to make your code faster."

## Post Length

- **Ideal**: 1000-2000 words
- **Minimum**: 500 words
- **Maximum**: 3000 words (consider splitting into series)

## Structure Checklist

- [ ] Engaging introduction (why should readers care?)
- [ ] Clear problem statement
- [ ] Step-by-step solution
- [ ] Working code examples
- [ ] Visual aids (screenshots, diagrams)
- [ ] Common pitfalls and solutions
- [ ] Key takeaways summary
- [ ] Links to related resources

## Code Examples

### Do's

✅ Include full, working examples
✅ Add comments explaining the code
✅ Show the expected output
✅ Handle common errors
✅ Explain the "why" behind the code

### Don'ts

❌ Don't use incomplete snippets
❌ Don't assume prior knowledge
❌ Don't skip error handling
❌ Don't mix multiple programming concepts
❌ Don't include irrelevant code

### Example Format

```r
# Load required packages
library(ksTFL)
library(dplyr)

# Create sample data
data <- tibble(
  subject_id = 1:100,
  treatment = rep(c("A", "B"), 50),
  value = rnorm(100, mean = 100, sd = 15)
)

# Generate table
result <- create_table(data, by = "treatment")
result
```

## Images and Visuals

### When to Include Images

✅ Screenshots of output
✅ Diagrams showing concepts
✅ Charts illustrating results
✅ Code execution results
✅ Step-by-step workflow diagrams

### Image Guidelines

- **Resolution**: 72-100 DPI for web
- **Format**: PNG for graphics, JPG for photos
- **Size**: Optimize for web (<500 KB)
- **Dimensions**: 600-800px width recommended
- **Alt text**: Always include descriptive alt text
- **File names**: Use descriptive names (good-chart.png, not img1.png)

### Image Organization

```
posts/2026-07-15-my-post/
├── index.qmd
├── featured.png          # Main preview image
└── images/
    ├── step-1.png
    ├── step-2.png
    └── comparison.jpg
```

## Categories

Use these predefined categories:

### Topic Categories
- **R** - General R programming
- **ksTFL** - ksTFL package specific
- **Clinical Programming** - Clinical trial analysis
- **Data Science** - Data analysis and visualization
- **Performance** - Code optimization
- **Reproducibility** - Reproducible research

### Level Categories
- **Introduction** - Beginner content
- **Tutorial** - Step-by-step guides
- **Advanced** - Intermediate+ content
- **Deep Dive** - In-depth exploration

### Post Type Categories
- **How-To** - Task-focused
- **Announcement** - News about tools/updates
- **Case Study** - Real-world example
- **Meta** - About the blog itself

### Example Combinations
```yaml
categories: [R, ksTFL, Tutorial]
categories: [Clinical Programming, Advanced, How-To]
categories: [Data Science, Performance]
```

## SEO Best Practices

### Description Field

- **Purpose**: Appears in search results and RSS feeds
- **Length**: 55-160 characters (60 ideal)
- **Include**: Main topic and benefit
- **Write for**: Humans, not just keywords

#### Examples

❌ "Post about ksTFL"

✅ "Learn to create clinical tables with ksTFL in minutes"

❌ "R programming"

✅ "Optimize your R code with vectorization techniques"

### Headings

- **Use hierarchy**: h2, h3, h4 in logical order
- **Include keywords**: Naturally, not forced
- **Make descriptive**: Not "Introduction" but "Getting Started with ksTFL"
- **Keep parallel**: Similar topics at same level

### Links

- Include relevant internal links to related posts
- Link to authoritative external resources
- Use descriptive link text (not "click here")

## Common Mistakes to Avoid

### Content Issues

- ❌ Assuming too much prior knowledge
- ❌ Mixing multiple complex topics
- ❌ Outdated code examples
- ❌ Untested code snippets
- ❌ Missing explanation of why something matters

### Formatting Issues

- ❌ Inconsistent code formatting
- ❌ Wall of text paragraphs (break into smaller chunks)
- ❌ Poor image quality or alignment
- ❌ Typos and grammar errors

### Technical Issues

- ❌ Broken links (internal or external)
- ❌ Missing alt text on images
- ❌ Incorrect YAML frontmatter
- ❌ Draft: true left in production posts

## Review Checklist

Before publishing:

- [ ] Content is technically accurate
- [ ] All code examples run without errors
- [ ] All links are functional
- [ ] All images display correctly
- [ ] Spelling and grammar are correct
- [ ] Title clearly conveys the topic
- [ ] Description is compelling (60 chars)
- [ ] Categories are accurate (2-4 tags)
- [ ] Featured image is present (if applicable)
- [ ] Draft: true is removed
- [ ] Date is correct
- [ ] Author name is set

## Collaboration

For group posts or reviews:

1. Create post with `draft: true`
2. Invite reviewer to check locally (`quarto preview`)
3. Collect feedback
4. Revise as needed
5. Set `draft: false`
6. Merge and push

## Performance Tips for Readers

### Large Code Blocks
Use `code-fold: true` in YAML to allow readers to expand/collapse:

```yaml
format:
  html:
    code-fold: true
```

### Table of Contents
Quarto auto-generates TOC from headings - use descriptive h2/h3 headings

### Search
Your posts are automatically indexed for the search feature

## Updating Posts

- Update the `date` field if making significant revisions
- Consider adding an "Update:" section at the end if minor changes
- Use commit messages to track major updates

## Examples of Great Posts

Look at the existing posts for inspiration:

- [Getting Started with ksTFL](../2026-07-06-getting-started-ks-tfl/index.html) - Tutorial with practical examples
- [Advanced ksTFL](../2026-07-07-advanced-ks-tfl/index.html) - Deep dive with complex features

Study their structure, code examples, and organization.

## Questions?

If you have questions about posting guidelines:
- Check existing posts for patterns
- Review the post template
- Consult the README.md
- Contact: contact@keystat-solutions.com

---

**Ready to write?** Use the post template at `posts/_post-template/index.qmd`
