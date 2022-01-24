class User < Sequel::Model
  plugin :secure_password, include_validations: false

  def validate
    super
    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_format /\A\w+\z/, :name, message: I18n.t(:format, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password') if new?
  end
end
