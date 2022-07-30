class GenerateXmlProcedureSheetJob < ApplicationJob
  queue_as :default

  def perform(procedure_sheet)
    # rendered_string = ApplicationController.render(
    #   :template => 'procedure_sheets/show',
    #   :assigns => { procedure_sheets: @procedure_sheet }
    # )

    # sou = ApplicationController.renderer.render(
    #     controller: 'procedure_sheets',
    #     action:     'show',
    #     id: procedure_sheet.id,
    #     formats: [:xml]
    # ).render :show, location: procedure_sheet

    xml = ApplicationController.render_to_string 'procedure_sheets/show.xml.erb', location: @procedure_sheet

    puts xml
  end
end
