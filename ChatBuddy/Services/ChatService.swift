import Foundation

class ChatService {
    
    private let responses: [String: [String]] = [
        "merhaba": [
            "Selam! Nasıl gidiyor?",
            "Merhaba! Bugün harika görünüyorsun.",
            "Selamlar, kodlama nasıl gidiyor?",
            "Hey! Seni gördüğüme sevindim.",
            "Merhabalar!"
        ],
        "nasilsin": [
            "İyiyim, seni sormalı?",
            "Her şey yolunda, ChatBuddy görev başında!",
            "Bomba gibiyim, sen nasılsın?",
            "Aynı tas aynı hamam, sen ne yapıyorsun?",
            "Harikayım, peki sen!"
        ],
        "iyiyim": [
            "Harika, bunu duyduğuma sevindim. Bugün aklından neler geçiyor?"
        ],
        "evet": [
            "Süper! O zaman bu yoldan devam ediyoruz. ✨",
            "Söyle bakalım",
            "Harika, mutabık kaldığımıza sevindim!",
            "Tamamdır."
        ],
        "hayir": [
            "Anlıyorum, o zaman başka bir alternatif düşünelim.",
            "Tamamdır, bu seçeneği eliyoruz.",
            "Peki, senin kararın. Başka ne yapmak istersin?",
            "Sorun değil, her zaman fikrini değiştirebilirsin. 😊"
        ],
        "gorusuruz": [
            "Görüşürüz!",
            "Kendine iyi bak, bir sonraki oturumda görüşmek üzere!",
            "İyi çalışmalar!",
            "Hoşça kal! ChatBuddy her zaman seninle. 🤖"
        ],
        "tesekkur": [
            "Rica ederim, lafı bile olmaz! 😊",
            "Sana yardımcı olabildiysem ne mutlu bana!",
            "Her zaman! Başka bir sorun olursa sormaktan çekinme.",
            "Ne demek! Yardımcı olabileceğim başka bir konu var mı?"
                ],
        "proje": [
            "Aklında nasıl bir şey var?",
          
        ],
        "yoruldum": [
            "Biraz ara vermeye ne dersin?",
            "Gözlerini ekrandan ayır ve 5 dakika uzağa bak, bu sana iyi gelecektir.",
        ],
        "hicbirsey": [
            "Anladım, bazen sadece dinlenmek ve hiçbir şey düşünmemek gerekir.",
            "O zaman bugünlük sadece havadan sudan konuşalım!"
        ],
        "default": [
            "Bunu tam anlayamadım ama kulağa ilginç geliyor!",
            "Biraz daha açar mısın?",
            "Hım, bunu veri tabanımda bulamadım.",
            "Anlıyorum...",
            "İlginç bir nokta!"
        ]
    ]
    
    func fetchResponse(from message: String, completion: @escaping (String?) -> Void) {
        // Kullanıcının mesajını küçük harfe çevirme
        let cleanMessage = message.lowercased().trimmingCharacters(in: .whitespaces)
        
        var possibleAnswers: [String] = []

        if cleanMessage.contains("merhaba") || cleanMessage.contains("selam") || cleanMessage == "hi" {
            possibleAnswers = responses["merhaba"]!

        } else if cleanMessage.contains("görüşürüz") || cleanMessage.contains("bye") || cleanMessage.contains("hoşçakal") || cleanMessage.contains("kapat") {
            possibleAnswers = responses["gorusuruz"]!

        } else if cleanMessage == "evet" || cleanMessage == "yes" || cleanMessage == "tamam" || cleanMessage == "ok" || cleanMessage == "aynen" {
            possibleAnswers = responses["evet"]!

        } else if cleanMessage == "hayır" || cleanMessage == "no" || cleanMessage == "olmaz" || cleanMessage == "değil" || cleanMessage == "yok" {
            possibleAnswers = responses["hayir"]!

        } else if cleanMessage.contains("teşekkür") || cleanMessage.contains("sağol") || cleanMessage.contains("thanks") {
            possibleAnswers = responses["tesekkur"]!

        } else if cleanMessage.contains("sen nasılsın") || cleanMessage.contains("sen nasilsin") || cleanMessage.contains("siz nasılsınız") {
            possibleAnswers = responses["nasilsin"]!

        } else if cleanMessage.contains("nasılsın") || cleanMessage.contains("nasil") || cleanMessage.contains("naber") || cleanMessage.contains("ne haber") {
            possibleAnswers = responses["nasilsin"]!

        } else if cleanMessage.contains("hiçbir şey") || cleanMessage.contains("hicbirsey") || cleanMessage.contains("hiç") || cleanMessage == "boşver" {
            possibleAnswers = responses["hicbirsey"]!

        } else if cleanMessage.contains("proje") || cleanMessage.contains("ödev") || cleanMessage.contains("kod") || cleanMessage.contains("swift") {
            possibleAnswers = responses["proje"]!

        } else if cleanMessage.contains("yoruldum") || cleanMessage.contains("uykum") || cleanMessage.contains("bıktım") || cleanMessage.contains("uykum var") || cleanMessage.contains("sadece biraz yoruldum galiba") {
            possibleAnswers = responses["yoruldum"]!

        } else if cleanMessage.contains("iyi") || cleanMessage.contains("süper") || cleanMessage.contains("harika") {
            possibleAnswers = responses["iyiyim"]!

        } else {
            possibleAnswers = responses["default"]!
        }
        let randomReply = possibleAnswers.randomElement()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(randomReply)
        }
    }
}
