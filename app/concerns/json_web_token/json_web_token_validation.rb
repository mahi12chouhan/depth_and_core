# frozen_string_literal: true

module JsonWebToken
  module JsonWebTokenValidation
    ERROR_CLASSES = [
      JWT::DecodeError,
      JWT::ExpiredSignature,
    ].freeze

    private

    def validate_json_web_token
      token = request.headers[:token] || params[:token]
      begin
        @token = JsonWebTokenService.decode(token)
      rescue *ERROR_CLASSES => exception
        handle_exception exception
      end
    end

    def handle_exception(exception)
      case exception
      when JWT::ExpiredSignature
        return render json: { errors: [token: 'Token has Expired'] },
          status: :unauthorized
      when JWT::DecodeError
        return render json: { errors: [token: 'Invalid token'] },
          status: :bad_request
      end
    end
  end
end
