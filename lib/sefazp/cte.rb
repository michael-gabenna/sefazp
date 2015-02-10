class Cte
  def initialize(xml_content)
    @xml_content = xml_content
  end

  def parse
    begin
      frete = nil
      pedagio = nil
      outros = nil
      doc = REXML::Document.new(@xml_content)
      keys = Array.new
      expedidor = !doc.elements["cteProc/CTe/infCte/exped/xNome"].nil?
      recebedor = !doc.elements["cteProc/CTe/infCte/receb/xNome"].nil?
      municipio_do_emitente = doc.elements["cteProc/CTe/infCte/emit/enderEmit/cMun"].get_text
      municipio_do_remetente = doc.elements["cteProc/CTe/infCte/rem/enderReme/cMun"].get_text
      municipio_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/enderDest/cMun"].get_text
      municipio_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/enderExped/cMun"].get_text : nil
      municipio_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/enderReceb/cMun"].get_text : nil
      municipio_de_origem = doc.elements["cteProc/CTe/infCte/ide/cMunIni"].get_text
      municipio_de_destino = doc.elements["cteProc/CTe/infCte/ide/cMunFim"].get_text
      municipio_de_emissao = doc.elements["cteProc/CTe/infCte/ide/cMunEnv"].get_text
      numero = doc.elements["cteProc/CTe/infCte/ide/nCT"].get_text
      serie = doc.elements["cteProc/CTe/infCte/ide/serie"].get_text
      chave_de_acesso = doc.elements["cteProc/CTe/infCte"].attributes["Id"]
      tipo_do_cte = doc.elements["cteProc/CTe/infCte/ide/tpCTe"].get_text
      tipo_do_servico = doc.elements["cteProc/CTe/infCte/ide/tpServ"].get_text
      tomador_do_servico = doc.elements["cteProc/CTe/infCte/ide/toma03/toma"].get_text
      forma_de_pagamento = doc.elements["cteProc/CTe/infCte/ide/forPag"].get_text
      codigo_do_cfop = doc.elements["cteProc/CTe/infCte/ide/CFOP"].get_text
      descricao_do_cfop = doc.elements["cteProc/CTe/infCte/ide/natOp"].get_text
      cnpj_do_emitente = doc.elements["cteProc/CTe/infCte/emit/CNPJ"].get_text
      inscricao_estadual_do_emitente = doc.elements["cteProc/CTe/infCte/emit/IE"].get_text
      nome_do_emitente = doc.elements["cteProc/CTe/infCte/emit/xNome"].get_text
      nome_fantasia_do_emitente = doc.elements["cteProc/CTe/infCte/emit/xFant"].get_text
      logradouro_do_emitente = doc.elements["cteProc/CTe/infCte/emit/enderEmit/xLgr"].get_text
      numero_do_emitente = doc.elements["cteProc/CTe/infCte/emit/enderEmit/nro"].get_text
      bairro_do_emitente = doc.elements["cteProc/CTe/infCte/emit/enderEmit/xBairro"].get_text
      cep_do_emitente = doc.elements["cteProc/CTe/infCte/emit/enderEmit/CEP"].get_text
      cnpj_do_remetente = doc.elements["cteProc/CTe/infCte/rem/CNPJ"].get_text
      inscricao_estadual_do_remetente = doc.elements["cteProc/CTe/infCte/rem/IE"].get_text
      nome_do_remetente = doc.elements["cteProc/CTe/infCte/rem/xNome"].get_text
      logradouro_do_remetente = doc.elements["cteProc/CTe/infCte/rem/enderReme/xLgr"].get_text
      numero_do_remetente = doc.elements["cteProc/CTe/infCte/rem/enderReme/nro"].get_text
      bairro_do_remetente = doc.elements["cteProc/CTe/infCte/rem/enderReme/xBairro"].get_text
      cep_do_remetente = doc.elements["cteProc/CTe/infCte/rem/enderReme/CEP"].get_text
      cnpj_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/CNPJ"].get_text
      inscricao_estadual_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/IE"].get_text
      nome_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/xNome"].get_text
      logradouro_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/enderDest/xLgr"].get_text
      numero_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/enderDest/nro"].get_text
      bairro_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/enderDest/xBairro"].get_text
      cep_do_destinatario = doc.elements["cteProc/CTe/infCte/dest/enderDest/CEP"].get_text
      cnpj_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/CNPJ"].get_text : nil
      inscricao_estadual_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/IE"].get_text : nil
      nome_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/xNome"].get_text : nil
      logradouro_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/enderExped/xLgr"].get_text : nil
      numero_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/enderExped/nro"].get_text : nil
      bairro_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/enderExped/xBairro"].get_text : nil
      cep_do_expedidor = expedidor ? doc.elements["cteProc/CTe/infCte/exped/enderExped/CEP"].get_text : nil
      cnpj_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/CNPJ"].get_text : nil
      inscricao_estadual_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/IE"].get_text : nil
      nome_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/xNome"].get_text : nil
      logradouro_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/enderReceb/xLgr"].get_text : nil
      numero_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/enderReceb/nro"].get_text : nil
      bairro_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/enderReceb/xBairro"].get_text : nil
      cep_do_recebedor = recebedor ? doc.elements["cteProc/CTe/infCte/receb/enderReceb/CEP"].get_text : nil
      produto_predominante = doc.elements["cteProc/CTe/infCte/infCTeNorm/infCarga/proPred"].get_text
      unidade_de_medida = doc.elements["cteProc/CTe/infCte/infCTeNorm/infCarga/infQ/tpMed"].get_text
      quantidade = doc.elements["cteProc/CTe/infCte/infCTeNorm/infCarga/infQ/qCarga"].get_text
      valor_da_mercadoria = doc.elements["cteProc/CTe/infCte/infCTeNorm/infCarga/vCarga"].get_text
      responsavel = doc.elements["cteProc/CTe/infCte/infCTeNorm/seg/respSeg"].get_text
      valor_total = doc.elements["cteProc/CTe/infCte/vPrest/vTPrest"].get_text
      valor_a_receber = doc.elements["cteProc/CTe/infCte/vPrest/vRec"].get_text
      base_de_calculo = doc.elements["cteProc/CTe/infCte/imp/ICMS/ICMS00/vBC"].get_text
      aliquota_icms = doc.elements["cteProc/CTe/infCte/imp/ICMS/ICMS00/pICMS"].get_text
      valor_icms = doc.elements["cteProc/CTe/infCte/imp/ICMS/ICMS00/vICMS"].get_text
      lotacao = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/lota"].get_text
      data_prevista_de_entrega = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/dPrev"].get_text
      tipo_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/tpVeic"].get_text
      placa_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/placa"].get_text
      uf_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/UF"].get_text
      renavan_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/RENAVAM"].get_text
      tara_em_kg_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/tara"].get_text
      capacidade_em_kg_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/capKG"].get_text
      capacidade_em_m3_do_veiculo = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/veic/capM3"].get_text
      nome_do_motorista = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/moto/xNome"].get_text
      cpf_do_motorista = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/moto/CPF"].get_text
      rntrc = doc.elements["cteProc/CTe/infCte/infCTeNorm/infModal/rodo/RNTRC"].get_text
      emissao = doc.elements["cteProc/CTe/infCte/ide/dhEmi"].get_text
      doc.get_elements("cteProc/CTe/infCte/vPrest/Comp").each do |comp|
        if comp.elements["xNome"].get_text == "FRETE VALOR"
          frete = comp.elements["vComp"].get_text
        elsif comp.elements["xNome"].get_text == "PEDAGIO"
          pedagio = comp.elements["vComp"].get_text
        elsif comp.elements["xNome"].get_text == "OUTROS"
          outros = comp.elements["vComp"].get_text
        end
      end
      if doc.get_elements("cteProc/CTe/infCte/infCTeNorm/infDoc/infNFe")
        doc.get_elements("cteProc/CTe/infCte/infCTeNorm/infDoc/infNFe").each do |key|
          keys << key.elements["chave"].get_text
        end
      end
      if doc.get_elements("cteProc/CTe/infCte/rem/infOutros")
        doc.get_elements("cteProc/CTe/infCte/rem/infOutros").each do |key|
          keys << key.elements["nDoc"].get_text
        end
      end

      return {
              expedidor: expedidor,
              recebedor: recebedor,
              municipio_do_emitente: municipio_do_emitente,
              municipio_do_remetente: municipio_do_remetente,
              municipio_do_destinatario: municipio_do_destinatario,
              municipio_do_expedidor: municipio_do_expedidor,
              municipio_do_recebedor: municipio_do_recebedor,
              municipio_de_origem: municipio_de_origem,
              municipio_de_destino: municipio_de_destino,
              municipio_de_emissao: municipio_de_emissao,
              numero: numero,
              serie: serie,
              chave_de_acesso: chave_de_acesso,
              tipo_do_cte: tipo_do_cte,
              tipo_do_servico: tipo_do_servico,
              tomador_do_servico: tomador_do_servico,
              forma_de_pagamento: forma_de_pagamento,
              codigo_do_cfop: codigo_do_cfop,
              descricao_do_cfop: descricao_do_cfop,
              cnpj_do_emitente: cnpj_do_emitente,
              inscricao_estadual_do_emitente: inscricao_estadual_do_emitente,
              nome_do_emitente: nome_do_emitente,
              nome_fantasia_do_emitente: nome_fantasia_do_emitente,
              logradouro_do_emitente: logradouro_do_emitente,
              numero_do_emitente: numero_do_emitente,
              bairro_do_emitente: bairro_do_emitente,
              cep_do_emitente: cep_do_emitente,
              cnpj_do_remetente: cnpj_do_remetente,
              inscricao_estadual_do_remetente: inscricao_estadual_do_remetente,
              nome_do_remetente: nome_do_remetente,
              logradouro_do_remetente: logradouro_do_remetente,
              numero_do_remetente: numero_do_remetente,
              bairro_do_remetente: bairro_do_remetente,
              cep_do_remetente: cep_do_remetente,
              cnpj_do_destinatario: cnpj_do_destinatario,
              inscricao_estadual_do_destinatario: inscricao_estadual_do_destinatario,
              nome_do_destinatario: nome_do_destinatario,
              logradouro_do_destinatario: logradouro_do_destinatario,
              numero_do_destinatario: numero_do_destinatario,
              bairro_do_destinatario: bairro_do_destinatario,
              cep_do_destinatario: cep_do_destinatario,
              cnpj_do_expedidor: cnpj_do_expedidor,
              inscricao_estadual_do_expedidor: inscricao_estadual_do_expedidor,
              nome_do_expedidor: nome_do_expedidor,
              logradouro_do_expedidor: logradouro_do_expedidor,
              numero_do_expedidor: numero_do_expedidor,
              bairro_do_expedidor: bairro_do_expedidor,
              cep_do_expedidor: cep_do_expedidor,
              cnpj_do_recebedor: cnpj_do_recebedor,
              inscricao_estadual_do_recebedor: inscricao_estadual_do_recebedor,
              nome_do_recebedor: nome_do_recebedor,
              logradouro_do_recebedor: logradouro_do_recebedor,
              numero_do_recebedor: numero_do_recebedor,
              bairro_do_recebedor: bairro_do_recebedor,
              cep_do_recebedor: cep_do_recebedor,
              produto_predominante: produto_predominante,
              unidade_de_medida: unidade_de_medida,
              quantidade: quantidade,
              valor_da_mercadoria: valor_da_mercadoria,
              responsavel: responsavel,
              valor_total: valor_total,
              valor_a_receber: valor_a_receber,
              base_de_calculo: base_de_calculo,
              aliquota_icms: aliquota_icms,
              valor_icms: valor_icms,
              lotacao: lotacao,
              data_prevista_de_entrega: data_prevista_de_entrega,
              tipo_do_veiculo: tipo_do_veiculo,
              placa_do_veiculo: placa_do_veiculo,
              uf_do_veiculo: uf_do_veiculo,
              renavan_do_veiculo: renavan_do_veiculo,
              tara_em_kg_do_veiculo: tara_em_kg_do_veiculo,
              capacidade_em_kg_do_veiculo: capacidade_em_kg_do_veiculo,
              capacidade_em_m3_do_veiculo: capacidade_em_m3_do_veiculo,
              nome_do_motorista: nome_do_motorista,
              cpf_do_motorista: cpf_do_motorista,
              rntrc: rntrc,
              emissao: emissao,
              frete: frete,
              pedagio: pedagio,
              outros: outros,
              keys: keys
             }
    rescue
      return nil
    end
  end
end
