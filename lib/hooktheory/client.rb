require 'httparty'

module HookTheory
  class Client
    include HTTParty
    BASE_URI = "https://api.hooktheory.com/v1/"
    InvalidUsernameOrPassword = Class.new(StandardError)
    InvalidRequest = Class.new(StandardError)

    def initialize(username:, password:)
      @username = username
      @password = password
      @headers = { "Accept" => "application/json", "Content-Type" => "application/json" }
      grab_auth
    end

    def songs(progression: [], page: 1)
      response = http_get(
        endpoint: "trends/songs",
        request_params: {
          cp: progression.join(","),
          page: page
        })

      response.map { |song| HookTheory::Song.new(song) }
    end

    def nodes(progression: [])
      response = http_get(
        endpoint: "trends/nodes",
        request_params: {
          cp: progression.join(","),
        })

      response.map { |node| HookTheory::Node.new(node) }
    end

    private

    def grab_auth
      auth = http_post(endpoint: "users/auth", body: {
        username: @username,
        password: @password
      })

      raise InvalidUsernameOrPassword if auth["activkey"].nil?
      @headers.merge!("Authorization" => "Bearer #{auth["activkey"]}")
    end

    def http_get(endpoint:, request_params: {})
      begin
        self.class.get(BASE_URI + endpoint,
          headers: @headers,
          query: request_params
        ).parsed_response
      rescue Exception => e
        raise InvalidRequest.new(e.message)
      end
    end

    def http_post(endpoint:, request_params: {}, body: {})
      begin
        self.class.post(BASE_URI + endpoint,
          headers: @headers,
          query: request_params,
          body: body.to_json
        ).parsed_response
      rescue Exception => e
        raise InvalidRequest.new(e.message)
      end
    end
  end
end
