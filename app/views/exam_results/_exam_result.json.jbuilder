json.extract! exam_result, :id, :exame, :dataSolicitacao, :dataRealizacao, :dataResultado, :result_id, :created_at, :updated_at
json.url exam_result_url(exam_result, format: :json)
