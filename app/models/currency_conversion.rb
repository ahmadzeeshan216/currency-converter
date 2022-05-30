
class CurrencyConversion < ApplicationRecord

  AVAILABLE_CURRENCIES = %w(USD JPY COP EUR DKK GTQ CNY CLP XAF KYD CAD)

  validates_presence_of :from, :to, :actual_amount
  validate :distinctiveness_in_currency_types

  before_save :convert_amount

  enum to: AVAILABLE_CURRENCIES, _prefix: :to
  enum from: AVAILABLE_CURRENCIES, _prefix: :from

  def distinctiveness_in_currency_types
    if to == from
      errors.add(:base, I18n.t('errors.currency_conversions.distinguish_currency_types'))
    end
  end

  def convert_amount
    self.converted_amount = Concurrency.convert(actual_amount, from, to)
  end
end
