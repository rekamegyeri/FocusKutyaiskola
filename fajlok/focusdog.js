// const hamburger = document.getElementById('hamburger'); 
// const navLinks = document.querySelector('.nav-links'); 

// hamburger.addEventListener('click', () => { 
//   navLinks.classList.toggle('active'); 
// });






const allStar = document.querySelectorAll('.rating .star');
const ratingValue = document.querySelector('.rating input');

allStar.forEach((item, idx)=> {
	item.addEventListener('click', function () {
		let click = 0
		ratingValue.value = idx + 1

		allStar.forEach(i=> {
			i.classList.replace('bxs-star', 'bx-star')
			i.classList.remove('active')
		})
          
		for(let i=0; i<allStar.length; i++) {
			if(i <= idx) {
				allStar[i].classList.replace('bx-star', 'bxs-star')
				allStar[i].classList.add('active')
			} else {
				allStar[i].style.setProperty('--i', click)
				click++
			}
		}
	})
});









document.querySelectorAll('.faq-question').forEach(button => { 
	button.addEventListener('click', () => { 
		const faqItem = button.closest('.faq-item'); 
		faqItem.classList.toggle('active'); 
	}); 
});











const showFormButtons = document.querySelectorAll('.sub-button'); 
const form = document.querySelector('.jelentkezes-form'); 
const formCloseButton = document.querySelector('#form-close'); 
const urlap = document.getElementById('jelentkezes-dialog'); 


showFormButtons.forEach(button => {
    button.addEventListener('click', () => {
        urlap.showModal(); 
    });
});


formCloseButton.addEventListener('click', () => {
    urlap.close(); 
});





// JELENTKEZES
const kurzusSelect = document.getElementById('kurzus');
const indulasSelect = document.getElementById('tanfolyam-indulas');
const oktatoSelect = document.getElementById('oktato');

const kurzusData = {

    "kolyok-kurzus": {
        indulas: [
            { value: "kolyok-kezdo", label: "Kezdő (2025.07.07)" },
            { value: "kolyok-halado", label: "Haladó (2025.07.14)" }
        ],
        oktato: "Takács Boldizsár"
    },

    "felnott-kurzus": {
        indulas: [
            { value: "felnott-kezdo", label: "Kezdő (2025.07.28)" },
            { value: "felnott-halado", label: "Haladó (2025.07.21)" }
        ],
        oktato: "Molnár Bernadett"
    },

    "idos-kurzus": {
        indulas: [
            { value: "idos-kezdo", label: "Kezdő (2025.08.04)" },
            { value: "idos-halado", label: "Haladó (2025.08.11)" }
        ],
        oktato: "Nagy Ákos"
    },

    "agility-kurzus": {
        indulas: [
            { value: "agility", label: "Agility (2025.08.18)" }
        ],
        oktato: "Tóth Kata"
    },
        
	"orzo-vedo-kurzus": {
        indulas: [
            { value: "orzo-vedo", label: "Őrző-védő (2025.08.04)" }
        ],
        oktato: "Kovács Tünde"
    },

    "egyeni-oktatas": {
        indulas: [
            { value: "egyeni", label: "Egyéni oktatás (Időpontért keresse fel oktatóinkat)" }
        ],
        oktato: "Kiss Erik"
    }
};

kurzusSelect.addEventListener('change', function() {
	const selectedKurzus = this.value;
    const selectedData = kurzusData[selectedKurzus];

   
    indulasSelect.innerHTML = '';
    selectedData.indulas.forEach(indulas => {
        const option = document.createElement('option');
        option.value = indulas.value;
        option.textContent = indulas.label;
        indulasSelect.appendChild(option);
    });

    
    oktatoSelect.innerHTML = '';
    const option = document.createElement('option');
    option.value = selectedData.oktato.toLowerCase().replace(/\s+/g, '-');
    option.textContent = selectedData.oktato;
    oktatoSelect.appendChild(option);
});


kurzusSelect.dispatchEvent(new Event('change'));





indulasSelect.addEventListener('change', function() {
    const selectedIndulas = this.options[this.selectedIndex];
    const indulasLabel = selectedIndulas.textContent;

    
    let indulasLabelInput = document.getElementById('tanfolyamindulas-label');
    if (!indulasLabelInput) {
        indulasLabelInput = document.createElement('input');
        indulasLabelInput.type = 'hidden';
        indulasLabelInput.name = 'tanfolyam-indulas_label';
        document.forms[0].appendChild(indulasLabelInput); 
    }
    indulasLabelInput.value = indulasLabel; 
});

document.addEventListener('DOMContentLoaded', function(){
    let indulasLabelInput = document.getElementById('tanfolyamindulas-label');
    let tanfind =  document.getElementById('tanfolyam-indulas');
    let firstOption = tanfind.options[0].innerText;
    console.log(firstOption);
    indulasLabelInput.value = firstOption;
});





kurzusSelect.addEventListener('change', function() {
    const selectedKurzusnev = this.options[this.selectedIndex];
    const KurzusnevLabel = selectedKurzusnev.textContent;
    let indulasLabelInput = document.getElementById('tanfolyamindulas-label');
    let tanfind =  document.getElementById('tanfolyam-indulas');
    
    let KurzusnevLabelInput = document.getElementById('kurzus-label');
    if (!KurzusnevLabelInput) {
        KurzusnevLabelInput= document.createElement('input');
        KurzusnevLabelInput.type = 'hidden';
        KurzusnevLabelInput.name = 'kurzus_label';
        document.forms[0].appendChild(KurzusnevLabelInput); 
    }
    
    
    let firstOption = tanfind.options[0].innerText;
    console.log(firstOption);
    indulasLabelInput.value = firstOption;
    
    KurzusnevLabelInput.value = KurzusnevLabel; 
});

document.addEventListener('DOMContentLoaded', function(){
    let KurzusnevLabelInput = document.getElementById('kurzus-label');
    let kurzusok =  document.getElementById('kurzus');
    let firstOption = kurzusok.options[0].innerText;
    console.log(firstOption);
    KurzusnevLabelInput.value = firstOption;
});



