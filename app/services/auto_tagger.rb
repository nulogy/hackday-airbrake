require 'fast_stemmer'

module AutoTagger
  extend self

  PM_DOMAINS = {
    'PM1' => [
        'production',
        'quoting',
        'icg'
      ].map(&:stem),
    'PM2' => [
        'shipping',
        'receiving',
        'isto',
        'ist',
        'ost',
        'gs1',
        'stock transfer',
        'job'
      ].map(&:stem),
    'PM3' => [
        'reporting',
        'picking',
        'inventory',
        'moves'
      ].map(&:stem),
    'QCloud' => [
        'qcloud'
        ]
  }

  def tag_error(error)
    phrase_lemmatized = lemmatize_error_phrase(error)

    tags = []

    PM_DOMAINS.each do |pm, domains|
      if domains.any? { |domain| phrase_lemmatized.include?(domain) }
        tags << Tag.where(name: pm).first
      end
    end

    tags
  end

  def lemmatize_error_phrase(error)
    phrase = [error.error_message, error.controller, error.action].join(' ')

    uncamelcased = phrase.gsub(/[A-Z]/, ' \0')

    bag_of_words = uncamelcased.gsub(/[\W_]/, ' ').squeeze(' ').strip.split
    lemmatized_bag_of_words = stem_words(bag_of_words)
    lemmatized_bag_of_words.join(' ')
  end

  def stem_words(words)
    words.map(&:stem)
  end
end