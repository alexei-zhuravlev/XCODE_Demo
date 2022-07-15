//
//  ViewController.swift
//  Modul34WithTextField
//
//  Created by Алексей Журавлев on 14.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputPostIdLabel: UITextField!
    @IBOutlet weak var textOfComments: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputPostIdLabel.layer.borderWidth = 2
        inputPostIdLabel.layer.borderColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
        inputPostIdLabel.layer.cornerRadius = 12
    }

//    Комменты к посту будем получать по нажатию кнопки
    @IBAction func getCommentsBtnPressed(_ sender: Any) {

        
// Получаем номер поста, который ввел пользователь
        guard let postID = inputPostIdLabel.text else {return}

//        Теперь нужно создать URL с введенным номером поста. Делаю это через URLComponents

//        Исходный (базовый URL, данный в задании)
        var components = URLComponents(string: "https://jsonplaceholder.typicode.com/comments?postId=NN")

//        Через компоненты задаем новые параметры зароса
        let queryItem = [URLQueryItem(name: "postId", value: postID)]

        components?.queryItems = queryItem
        
//        Получаем URL с новыми параметрами запроса
        let url = components?.url
        
//      Выполняем собстенно запрос GET
        guard let requestUrl = url else { return }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data,
                    let dataString = String(data: data, encoding: .utf8),
                    (response as? HTTPURLResponse)?.statusCode == 200,
                    error == nil else { return }
//            проверяем полученный результат на пустоту. Так как результат ВСЕГДА приходит строкой с двумя квадратными скобками - удаляем их
            let newText = dataString.replacingOccurrences(of: "[", with: "")
            let newTextTwo = newText.replacingOccurrences(of: "]", with: "")

            //Далее переводим работу в основной поток. Если полученный запросом результат пустой (то есть просто []), то выводим соответствуюющее сообщение на экран, если нет - чистим от лишних знаков (которые пока не знаем как обработать корректно) и выводим на экран приложения получившееся.
            DispatchQueue.main.async {
                if !newTextTwo.isEmpty{
//                    удаляем "лишние" скобки и запятые просто для того, чтобы красивее выоводился результат
                    let preFinalText = newTextTwo.replacingOccurrences(of: "{", with: "")
                    let preFinalTextTwo = preFinalText.replacingOccurrences(of: ",", with: "")
                    let finalText = preFinalTextTwo.replacingOccurrences(of: "}", with: "")
                    self.textOfComments.text = finalText
                }else{
                    self.textOfComments.text = "Нет Постов с таким номером PostID"
                }

            }
            }
            task.resume()

    }
    
}

