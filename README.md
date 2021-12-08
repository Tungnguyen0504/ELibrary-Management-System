<div id="top"></div>

<h3 align="center">ELibrary Center - Library Management System</h3>

  <p align="center">
    <a href="https://github.com/Tungnguyen0504/E-Library-Management-System"><strong>Explore the docs »</strong></a>
    <br />
    <br />
  </p>
</div>



<!-- ABOUT THE PROJECT -->
## About The Project <br>

![home](https://user-images.githubusercontent.com/91137455/145161627-77a95ab5-c0f1-4d83-9941-56d4e6cf9c96.jpg)


Management software for monitoring and controlling the transactions in a library .The project “Library Management System” is developed in C#, which mainly focuses on basic operations in a library like borrow/return book, adding new books, and updating new information, searching books and members.

This project of “LIBRARY MANAGEMENT” of gives us the complete information about the library. We can enter the record of new books and retrieve the details of books available in the library. We can issue the books to the students and maintain their records and can also check how many books are issued and stock available in the library. In this project we can maintain the late fine of students who returns the issued books after the due date.

<p align="right">(<a href="#top">back to top</a>)</p>

### Functionalities

1. Borrow process.
* The borrower can borrow the books by bring id of the book they want to borrow to librarian. 
* The librarian will check if it is the expected borrower. The librarian will then take the reserved copy and loan it out to the borrower.
* The id of each book to be borrowed is then keyed into the machine. The status of each copy indicates it is available, can borrow or not. Only the available copy is allowed to be borrowed. A 2 week loan period is allowed per book. A referenced or borrowed copy is not allowed to be borrowed. If the copies to be borrowed are all available, the copy number, book name, borrow date and expected return date is used for confirmation
* The maximum number of copies allowed to be borrowed is 5.
2. Return process.
* The book will be returned is brought to counter. The librarian then keys in the id number.
* The copy number, book name, and borrower name is checked for confirmation. If the book is overdue, the borrower will have to pay a fine of 2 USD per day
* The librarian will keep the id if there is a reservation waiting for a id book and, a first come first served basis is used to assign to the borrower.
3. Reservation process.
* Books may be reserved. Before the reservation is accepted, a check is made if they are any available book in the shelf.
* If they are available books, the reservation is rejected and the reason is made known. If all available copies are out, the reservation is accepted.
* The following is accepted for the reservation
  The book number
  The borrower card number
* A first come, first served basic is used to assign id book when they are returned.
* A borrower can only make 1 reservation.
4. Book registration process.
* The librarian may also register new books into the Library.
* The registration can be an
    ```
    1.	Addition of a new book
    This means a new id book can be appended to an existing set of copies. The book number, the number of new book, and price of each book is entered
    2.	Creation of a new book entry and copy
    The librarian enter the information of new book
    A book is automatically generated by the system
    ```
5. Borrower registration process.
* The following information are recorded when a new borrower is registered.
6. Notification.
* Notify for borrower when the reservation is accepted.
### Documentation
[SD_LibraryManagementSystem.docx](https://github.com/Tungnguyen0504/E-Library-Management-System/files/7673790/SD_LibraryManagementSystem.docx)


### Built With

* [HTML](https://www.w3schools.com/html/)
* [CSS](https://www.w3schools.com/css/)
* [Javascript](https://www.w3schools.com/js/)
* [C Sharp](https://docs.microsoft.com/vi-vn/dotnet/csharp/)
* [Bootstrap](https://getbootstrap.com)
* [JQuery](https://jquery.com)

<p align="right">(<a href="#top">back to top</a>)</p>


### Installation

1. Development Platform - Visual Studio 2019.
2. Database - SQL SERVER.
3. Run Database.
4. Configure your databse configuration in `Web.config`.

   ```sh
    <connectionStrings>
      <add name="DbConnectionString" connectionString="server=localhost;database=YOUR NAME DATABASE;Integrated security=true"/>
    </connectionStrings>
   ```
6. Run `homepage.aspx` as start page.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Screen short

* Demo user role:
 

https://user-images.githubusercontent.com/91137455/145194947-071abecc-6725-4f3a-9555-f3e46ead645a.mp4

* Demo admin role:


https://user-images.githubusercontent.com/91137455/145195129-a3e48d8f-a14b-4efa-a567-43abcd0727ed.mp4

* Demo borrow book:


https://user-images.githubusercontent.com/91137455/145195166-7739c909-4dfb-4b88-971a-21107f036d5f.mp4

* Demo return book:


https://user-images.githubusercontent.com/91137455/145195215-b525567b-76cd-455a-9c97-9f437c2f39c9.mp4

* Diagram:
![diagram](https://user-images.githubusercontent.com/91137455/145210616-44d1f01e-44dd-43af-818e-3daac8062471.png)


## Somethings wrong!!

If you find that something's wrong with this package, you can let me know by raising an issue on the GitHub issue tracker, 
or take it as a task and 🧑‍💻 resolve it 💪 --> create a PullRequest 🛠.

<!-- CONTRIBUTING -->
## Contributing

Contributors are most welcome.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Facebook - <a href="https://www.facebook.com/chang.namay/">Tùng Nguyễn</a>

Email - <a href="tungnguyenn0504@gmail.com">tungnguyenn0504@gmail.com</a>

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username

