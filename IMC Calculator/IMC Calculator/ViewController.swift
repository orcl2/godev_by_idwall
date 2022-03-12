//
//  ViewController.swift
//  IMC Calculator
//
//  Created by Idwall Go Dev 003 on 12/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: IBAction
    @IBAction func calcularPressionado(_ sender: UIButton) {
        if let peso = pesoTextField.text,
           !pesoTextField.text!.isEmpty,
           let altura = alturaTextField.text,
           !alturaTextField.text!.isEmpty
        {
            let pesoNumerico = try! Double(peso, format: .number)
            let alturaNumerica = try! Double(altura, format: .number)
            
            let imcCalculado = retornaIMCCalculado(peso: pesoNumerico, altura: alturaNumerica)
            
            atualizarTela(imcCalculado)
            
            return
        }
        
        mostraMensagemValidacao()
    }
    
    // MARK: Public Methods
    func retornaIMCCalculado(peso: Double, altura: Double) -> Double{
        return peso / (altura * altura)
    }
    
    // MARK: Private Methods
    private func mostraMensagemValidacao() {
        let title = "Campo Vazio"
        let message = "Informe seu peso e altura para executar o cálculo de IMC."
        
        let alertaCamposVazios = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertaCamposVazios.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alertaCamposVazios, animated: true, completion: nil)
    }
    
    private func atualizarTela(_ imc: Double) {
        resultadoLabel.isHidden = false
        
        let mensagemIMC = retornaMensagemConformeIMC(imc: imc)
        let mensagemResultado = """
            IMC Calculado: %.2f
            \(mensagemIMC)
        """
        
        resultadoLabel.text = String(format: mensagemResultado, imc)
    }
    
    private func retornaMensagemConformeIMC(imc: Double) -> String {
        switch imc {
        case  ..<18.5:
            return "Você está abaixo do peso seu ideal"
        case 18.5...24.9:
            return "Você está no seu peso ideal"
        case 25.0...29.9:
            return "Você está com sobrepeso"
        case 30...34.9:
            return "Você está com obesidade GRAU 1"
        case 35...39.9:
            return "Você está com obesidade GRAU 2"
        default:
            return "Você está com obesidade GRAU 3"
        }
    }
    
    //Mandar mensagem no slack
    //Nomear time
    //Nomes dos integrantes
    //Github do projeto
    
    //izabela mateus
    //pamela lima
    //vitor hugo
    //luiz kokumai
    //william daniel
}

