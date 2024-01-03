class DiseaseInfo {
  final String imageUrl;
  final String title;
  final String desc;

  DiseaseInfo(this.imageUrl, this.title, this.desc); 
}

List<List<DiseaseInfo>> allDiseases = [
    [
      DiseaseInfo('assets/img/streptodermiya2.jpg', 'Стрептодермии ','Стрептодерми́я, или «лету́чий ого́нь», — пиодермия, вызываемая стрептококками; характеризуется возникновением фликтен. Стрептодермии делятся на поверхностные и глубокие. '),
      DiseaseInfo('assets/img/papiloma.jpg', 'Папилломы','Папилломы – это небольшие кожные новообразования, которые могут выступать над поверхностью кожи. Они могут появляться на любом участке тела и особенно часто возникают в тех местах, где кожа подвергается трению – например, в складках на шее, где происходит трение о цепочку или одежду.'),
      DiseaseInfo('assets/img/kozhy.jpg', 'Абсцесс кожи','Абсцесс кожи – это локальное скопление гноя в коже, которое может формироваться на любом участке кожного покрова. Симптомами и признаками заболевания являются боль и образование болезненного плотного или флуктуирующего инфильтрата.'),
      DiseaseInfo('assets/img/chesotka.jpeg', 'Чесотка','Чесотка — это паразитарная инвазия, вызванная микроскопическими клещами, которые проникают в кожу и откладывают яйца, вызывая сильный зуд и сыпь.'),
      DiseaseInfo('assets/img/exemaa.jpg', 'Экзема','Экзема – это хроническое воспалительное кожное заболевание, сопровождающееся зудом, покраснением и высыпаниями в виде маленьких пузырьков с жидкостью. Высыпания напоминают пузырьки воздуха, образующиеся при закипании воды. Отсюда и название заболевания (с греч. eczeo - вскипать).'),
    ],
    [
      DiseaseInfo('assets/img/rak_grudi.jpg', 'Рак груди','Рак молочной железы – заболевание, при котором патологические клетки в тканях молочной железы начинают бесконтрольно делиться и образуют опухоль'),
      DiseaseInfo('assets/img/rak_legkogo.webp', 'Рак легкого','Рак легкого – разновидность рака, вызванная неконтролируемым ростом патологических клеток в тканях легких. '),
      DiseaseInfo('assets/img/rak_yaz.jpg', 'Рак языка и полости рта','Рак ротовой полости – злокачественная опухоль, происходящая из слизистой ротовой полости. '),
      DiseaseInfo('assets/img/rak_zheludka.gif', 'Рак поджелудочной железы','Рак поджелудочной железы — злокачественное новообразование, которое поражает орган человека, отвечающий за выделение необходимых для пищеварения ферментов.'),
      DiseaseInfo('assets/img/rak_zheludka.gif', 'Рак желудка','Рак желудка развивается из эпителиальных клеток органа. Вначале опухоль поражает слизистую оболочку желудка, а по мере роста проникает в мышечную и серозную оболочки и разрушает стенку органа.'),
    ],
    [
      DiseaseInfo('assets/img/sindrom_dauna.webp', 'Синдром Дауна','Синдром Дауна – это генетическое заболевание, вызванное аномалией 21-й хромосомы, которое проявляется в виде умственной отсталости, пороков сердца и нарушения развития'),
      DiseaseInfo('assets/img/mozgovoi.png', 'Спинальный мозговой порок','Спина бифида (расщепление позвоночника) – это сложный врожденный дефект развития спинного мозга и и позвоночника. Это - тип открытого дефекта нервной трубки в котором есть аномалия развития задних частей позвоночника, спинного мозга, окружающих нервов и/или заполненного жидкостью мешка, который окружает спинной мозг.'),
      DiseaseInfo('assets/img/edvardca.jpg', 'Синдром Эдвардса','Синдром Эдвардса (Трисомия 18) — это хромосомное заболевание, связанное с аномалиями во многих частях тела. Люди с синдромом Эдвардса часто страдают от медленного роста до рождения (задержка внутриутробного развития) и низкого веса при рождении.'),
      DiseaseInfo('assets/img/sindrom_uaildera.webp', 'Синдром Уайльдера','(описан американским офтальмологом W. Н. Wilder, 1860–1935) – признак начальной стадии тиреотоксического экзофтальма: небольшие подергивания глазного яблока с чередованием приведения и отведения.'),
      DiseaseInfo('assets/img/sindrom_turnera.webp', 'Синдром Турнера ','Синдром Турнера (Turner syndrome), также известный как моносомия Х, представляет собой генетическое расстройство, при котором у женщины отсутствует или частично отсутствует один из двух половых хромосом X. '),
    ],
  ];