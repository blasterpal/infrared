module Support
  module MockResponses
    require 'json'

    def mock_draft_post
      '{
  "posts": [
    {
      "id": 5,
      "uuid": "b8451762-0e89-4195-969d-f107bbbda8ab",
      "title": "Infrared Test",
      "slug": "infrared-test",
      "markdown": "#Title",
      "html": "<h1 id=\"title\">Title</h1>",
      "image": null,
      "featured": false,
      "page": false,
      "status": "draft",
      "language": "en_US",
      "meta_title": null,
      "meta_description": null,
      "created_at": "2014-06-13T17:19:44.161Z",
      "created_by": 1,
      "updated_at": "2014-06-21T13:26:34.913Z",
      "updated_by": 1,
      "published_at": null,
      "published_by": null,
      "tags": [
        4,
        8
      ],
      "fields": [],
      "author": 1
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "limit": 15,
      "pages": 1,
      "total": 1,
      "next": null,
      "prev": null
    }
  }
}'
    end

    def mock_published_post
      '
{
  "posts": [
    {
      "id": 1,
      "uuid": "cad4e543-ab1a-49ae-b65c-296df338d13d",
      "title": "Welcome to Ghost",
      "slug": "welcome-to-ghost",
      "markdown": "Youre live!",
      "html": "<p>Youre live!</p>",
      "image": null,
      "featured": false,
      "page": false,
      "status": "published",
      "language": "en_US",
      "meta_title": null,
      "meta_description": null,
      "created_at": "2014-06-07T01:32:11.777Z",
      "created_by": 1,
      "updated_at": "2014-06-07T01:32:11.777Z",
      "updated_by": 1,
      "published_at": "2014-06-07T01:32:11.787Z",
      "published_by": 1,
      "tags": [
        1
      ],
      "fields": [],
      "author": 1
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "limit": 15,
      "pages": 1,
      "total": 1,
      "next": null,
      "prev": null
    }
  }
}'
    end

    def mock_all_posts
      '{
  "posts": [
    {
      "id": 5,
      "uuid": "b8451762-0e89-4195-969d-f107bbbda8ab",
      "title": "Infrared Test",
      "slug": "infrared-test",
      "markdown": "#Title",
      "html": "<h1 id=\"title\">Title</h1>",
      "image": null,
      "featured": false,
      "page": false,
      "status": "draft",
      "language": "en_US",
      "meta_title": null,
      "meta_description": null,
      "created_at": "2014-06-13T17:19:44.161Z",
      "created_by": 1,
      "updated_at": "2014-06-21T13:26:34.913Z",
      "updated_by": 1,
      "published_at": null,
      "published_by": null,
      "tags": [
        4,
        8
      ],
      "fields": [],
      "author": 1
    },
    {
      "id": 1,
      "uuid": "cad4e543-ab1a-49ae-b65c-296df338d13d",
      "title": "Welcome to Ghost",
      "slug": "welcome-to-ghost",
      "markdown": "You live!",
      "html": "<p>You live!</p>",
      "image": null,
      "featured": false,
      "page": false,
      "status": "published",
      "language": "en_US",
      "meta_title": null,
      "meta_description": null,
      "created_at": "2014-06-07T01:32:11.777Z",
      "created_by": 1,
      "updated_at": "2014-06-07T01:32:11.777Z",
      "updated_by": 1,
      "published_at": "2014-06-07T01:32:11.787Z",
      "published_by": 1,
      "tags": [
        1
      ],
      "fields": [],
      "author": 1
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "limit": 15,
      "pages": 1,
      "total": 2,
      "next": null,
      "prev": null
    }
  }
}'
    end

  end
end
