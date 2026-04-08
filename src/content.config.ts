import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const comparisons = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/comparisons' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    country: z.string(),
    region: z.enum(['europe', 'asia', 'americas', 'middle-east-africa', 'oceania']),
    silo: z.string(),
    pillar: z.string(),
    providers: z.array(z.object({
      name: z.string(),
      rank: z.number(),
      rating: z.number(),
      ctaUrl: z.string().optional(),
    })),
    heroImage: z.string().optional(),
    author: z.string().default('Mika Soren'),
  }),
});

const blog = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/blog' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    category: z.string().optional(),
    region: z.string().optional(),
    silo: z.string().optional(),
    relatedComparisons: z.array(z.string()).optional(),
    heroImage: z.string().optional(),
    heroImageAlt: z.string().optional(),
    author: z.string().default('Mika Soren'),
  }),
});

const pillars = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/pillars' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    pubDate: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    region: z.string().optional(),
    relatedComparisons: z.array(z.string()).optional(),
    heroImage: z.string().optional(),
    author: z.string().default('Mika Soren'),
  }),
});

export const collections = { comparisons, blog, pillars };
