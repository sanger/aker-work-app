# frozen_string_literal: true

module Aker
  class ProductProcess < ApplicationRecord
    belongs_to :product, required: true
    belongs_to :aker_process, class_name: 'Aker::Process', required: true

    validates :stage, presence: true
  end
end
