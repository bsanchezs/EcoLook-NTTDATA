//
//  NewPostViewController.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 28/06/22.
//

import UIKit

class NewPostViewController: UIViewController {

    @IBOutlet weak var labelTitleHeader: UILabel!
    @IBOutlet weak var buttonGoBackHeader: UIButton!
    @IBOutlet weak var imageViewPhotoNewPost: UIImageView!
    @IBOutlet weak var buttonAddPhotoNewPost: UIButton!
    @IBOutlet weak var inputTitleNewPost: UITextField!
    @IBOutlet weak var inputDirectionNewPost: UITextField!
    @IBOutlet weak var buttonDirectionNewPost: UIButton!
    @IBOutlet weak var textViewDescriptionNewPost: UITextView!
    @IBOutlet weak var sliderRiskLevelNewPost: UISlider!
    @IBOutlet weak var collectionViewTagsNewPost: UICollectionView!
    @IBOutlet weak var buttonSaveNewPost: UIButton!
    
    var setTagsSelectedNewPost = Set<String>()
    var latNewPost: Double?
    var lngNewPost: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ThemeColors.verdeBackground
        
        labelTitleHeader.textColor = ThemeColors.verdePrimary
        buttonGoBackHeader.tintColor = ThemeColors.verdePrimary
        
        imageViewPhotoNewPost.layer.cornerRadius = 15
        
        buttonDirectionNewPost.tintColor = ThemeColors.verdePrimary
        
        textViewDescriptionNewPost.backgroundColor = .white
        textViewDescriptionNewPost.layer.borderWidth = 1
        textViewDescriptionNewPost.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.08)
        textViewDescriptionNewPost.layer.cornerRadius = 15
        
        sliderRiskLevelNewPost.thumbTintColor = ThemeColors.verdePrimary
        sliderRiskLevelNewPost.tintColor = ThemeColors.verdePrimary
        sliderRiskLevelNewPost.isContinuous = false
        
        collectionViewTagsNewPost.showsVerticalScrollIndicator = false
        collectionViewTagsNewPost.backgroundColor = ThemeColors.verdeBackground
        collectionViewTagsNewPost.dataSource = self
        
        buttonSaveNewPost.backgroundColor = ThemeColors.verdePrimary
        buttonSaveNewPost.tintColor = .white
        buttonSaveNewPost.layer.cornerRadius = 15
        
        
        
        
    }
    @IBAction func actionButtonGoBackHeader(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func actionButtonAddImage(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        
//        imageViewPhotoNewPost.image = UIImage(named: "Contaminacion-2")
        
//        sender.isEnabled = false
        
        
    }
    
    @IBAction func actionSliderChange(_ sender: UISlider) {
        
        switch sender.value{
            
            case 1..<1.5:
                //print("Seria Lvl 1")
                sender.value = 1
            case 1.5..<2.5:
                //print("Seria Lvl 2")
                sender.value = 2
            case 2.5..<3.5:
                //print("Seria Lvl 3")
                sender.value = 3
            case 3.5..<4.5:
                //print("Seria Lvl 4")
                sender.value = 4
            case 4.5...5:
                //print("Seria Lvl 5")
                sender.value = 5
            default:
                print("Valor invalido")
                
            
        }
        
        
//        print("Quiero ver que trae: \(sender.value)")
        
        
        
    }
    
    @IBAction func actionButtonSaveNewPost(_ sender: Any) {
        
        let formStatus = verifyInputsNewPost()
        
        switch formStatus {
            case .incomplete:
                let message = "Por favor, rellene todos los campos"
                showErrorAlert(message: message)
                
            case .wrongData:
                let message = "Por favor, introduzca formatos validos"
                showErrorAlert(message: message)
                
            case .null:
                let message = "Por favor seleccione una imagen"
                showErrorAlert(message: message)
                
            case .success:
                //TODO
                
                var arrayTagsSelected: [Tag] = []
            
                if !setTagsSelectedNewPost.isEmpty {
                        
                    for nameTag in setTagsSelectedNewPost {
                        
                        let tag = arrEtiquetasTotales.filter( {$0.name == nameTag } )
                        arrayTagsSelected.append(tag[0])
                        
                    }
                    
                }
            
                let image = imageViewPhotoNewPost.image!.jpegData(compressionQuality: 0.2)?.base64EncodedString()
            
                //let imagen = imageViewPhotoNewPost.image!
                //let compresion = imagen.jpegData(compressionQuality: 0.2)
                //print("Tipo de la compresion: ", type(of: compresion))
                //print("resultado de compresion: ", compresion)
                //let b64 = compresion?.base64EncodedString(options: .lineLength64Characters)
                //print("Tipo de b64: ", type(of: b64))
                //print("B64: ", b64)
    
                
                guard let imageSafe = image else{
                    return
                }
                
//                print("Imagen en b64?: \(image!)")
            
                let title = inputTitleNewPost.text!
                let direction = inputDirectionNewPost.text!
                let description = textViewDescriptionNewPost.text!
                let risklvl = Int(sliderRiskLevelNewPost.value)
                let date = Date().getFormattedDate(format: "dd/MM/yyyy")
            
                var newPost = Post()
            
                if let lat = latNewPost, let lng = lngNewPost{
                    
                    print("Los dos tienen valores")

                    newPost = Post(idPublicacion: 0, titulo: title, descripcion: description, nivelRiesgo: risklvl, direccion: direction, latitud: lat, longitud: lng, imagen: imageSafe, fecha: date, arrayEtiquetas: arrayTagsSelected, idUsuario: 1, estado: 1)

                    
                }else{
                    
                    print("Alguno de los dos son nulos")
                    
                    newPost = Post(idPublicacion: 0, titulo: title, descripcion: description, nivelRiesgo: risklvl, direccion: direction, imagen: imageSafe, fecha: date, arrayEtiquetas: arrayTagsSelected, idUsuario: 1)

                    
                }
                
                print("El post a enviar seria: \(newPost)")
            
            
                
                
            
        }
        
        
        
    }
    

}

extension NewPostViewController {
    
    func verifyInputsNewPost() -> FormStatus {
        
        guard let titulo = inputTitleNewPost.text, let direccion = inputDirectionNewPost.text, let descripcion = textViewDescriptionNewPost.text, let _ = imageViewPhotoNewPost.image else{
            return .null
        }
        
        if titulo == "" || direccion == "" || descripcion == "" {
            
            return .incomplete
            
        }else{
            
            return .success
            
        }
        
        
    }
    
    func showErrorAlert( message: String ){
        
        let okay = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension NewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            imageViewPhotoNewPost.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension NewPostViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrEtiquetasTotales.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCellTagNewPost", for: indexPath) as? TagsNewPostCollectionViewCell
        
        cell?.buttonTagNewPost.setTitle(arrEtiquetasTotales[indexPath.row].name, for: .normal)
        
        cell?.buttonTagNewPost.tag = arrEtiquetasTotales[indexPath.row].id
        
        cell?.delegate = self
        
        return cell!
        
        
    }
    
    
    
}

extension NewPostViewController: ButtonNewPostViewCollectionCellDelegate{
    
    func btnAddDeleteTagNewPost(btnTagName: String?) {
        
        guard let tagName = btnTagName else{
            return
        }
        
        if setTagsSelectedNewPost.contains(tagName) {
            
            setTagsSelectedNewPost.remove(tagName)
            
        }else{
        
            setTagsSelectedNewPost.insert(tagName)
            
        }
        
        
//        setTagsSelectedNewPost.contains(tagName) == true ? setTagsSelectedNewPost.insert(tagName) : setTagsSelectedNewPost.remove(tagName)
        
        
        print(setTagsSelectedNewPost)
        
    }
    
    
}
