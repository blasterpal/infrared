require 'sinatra'

class ApiDummyApp < Sinatra::Application

  @@connect_sid = "ASDFGHU1234"

  get '/ghost/signin/' do
    [200,
    session_cookie.merge!(default_headers),
    csrf_body]
  end
  
  post '/ghost/signin/' do
    [200,
      session_cookie.merge!(default_headers),
      csrf_body]
  end

  post '/ghost/signin/' do
    # email = params[:email]
    # password = params[:password]
    # token = request.env['X-CRSF-Token']
    response.set_cookie "connect.sid", :value => @@connect_sid, :path => '/ghost'
  end

  get '/ghost/api/v0.1/posts/' do
    puts "PARMAS!#{params}"
    case params['status']
    when 'published'
      [200,json_headers,mock_published_post]
    when 'draft'
      [200,json_headers,mock_draft_post]
    when 'all'
      [200,json_headers,mock_all_posts]
    end
  end

    
  private 

  def default_headers
      {
        "Accept" => "*/*",
        # "Accept-Encoding" => 'gzip,deflate,sdch',
        "Accept-Language" => "en-US,en;q=0.8",
        "Connection" => "keep-alive",
        "Content-Type" => 'application/x-www-form-urlencoded; charset=UTF-8',
        "X-Requested-With" => "XMLHttpRequest",
        "X-CSRF-Token" => 'ASD123ZXC'}
  end

  def json_headers
    {'Cache-Control' => 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0',
      'Connection' => 'keep-alive',
      'Content-Encoding' => 'gzip',
      'Content-Type' => 'application/json; charset=utf-8',
      'Date' => 'Sat, 21 Jun 2014 12:54:20 GMT',
      'ETag'=> "-531752660",
      'Transfer-Encoding' => 'chunked',
      'Vary' => 'Accept-Encoding',
      'X-Powered-By' => 'Express'
    }
  end

  def session_cookie
    {"Set-Cookie" => "connect.sid=3AOBGJm6; Path=/ghost/; Expires=Sun, 15 Jun 2019 09:15:08 GMT; HttpOnly"}
  end

  def csrf_body
    %{<html><head>
      <meta name="csrf-param" content="Zhgew1B2MW/KCWJ3LUjLf/+rAIJYuzqfc6fh4=" />
      </head>
      <body/>
      </html>
    }
  end

end
