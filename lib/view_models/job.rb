# frozen_string_literal: true

# A ViewModel for the job partial
module ViewModels
  class Job
    include JobsHelper

    attr_reader :job
    delegate :id, to: :job

    def initialize(args)
      @job          = args.fetch(:job)
      @last_process = args.fetch(:last_process)
    end

    def css_classes
      "active" if job.forwarded
    end

    def job_id
      id
    end

    def job_input_set
      job.input_set
    end

    def status_label
      job_status_label(job)
    end

    def concluded_date
      (job.completed || job.cancelled)&.to_s(:short)
    end

    def job_output_set
      job.output_set
    end

    def has_revised_set?
      job.revised_output_set_uuid?
    end

    def job_revised_output_set
      job.revised_output_set
    end

    def show_revised_set_button?
      return false if last_process?
      job.forwarded?
    end

    def show_check_box?
      !last_process?
    end

    private

    attr_reader :last_process

    def last_process?
      last_process
    end

  end
end