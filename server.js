const log =console.log;
const connection = require('./config/connection');
const inquirer = require('inquirer');
const cTable = require('console.table');
const chalk = require('chalk');
const figlet = require('figlet');
const ora = require('ora');







log(
    chalk.yellow.bold(
        figlet.textSync("Employees ", { horizontalLayout: "full" })
    )
);
log(
    chalk.yellow.bold(
        figlet.textSync("Management System", { horizontalLayout: "full" })
    )
);
log(
    chalk.yellow.bold(figlet.textSync("By Ali Alaoui", { horizontalLayout: "full" }))
);

log("                           ");
log("                           ");
log("                           ");
log(
    chalk.bold.blue(
        "================================================================================"
    )
);


log(
    chalk.whiteBright.bold(
        "Please Select one option and hit " + chalk.cyan.bold("<enter>")
    )
);

log(
    chalk.bold.blue(
        "================================================================================"
    )
);
log("                           ");
log("                           ");
log("                           ");










connection.connect((error) => {
  if (error) throw error;
  promptUser();
});


const promptUser = () => {
  inquirer.prompt([
      {
        name: 'choices',
        type: 'list',
        message: 'Please select an option:',
        choices: [
        'View All Employees',
        'View All Roles',
        'View All Departments',
        'View All Employees By Department',
        'View All Employees By Roles',
        'View All Employees By Manager',
        'View Unfulfilled Positions Roles',
        'View Employees Count By Role',
        'View Employees Count By Department',
        'View Salary Metrics By Department',        
        'Exit'
          ]
      }
    ])
    .then((answers) => {
      const {choices} = answers;


        if (choices === 'View All Employees') {

            getData('employees_view');
        }

        if (choices === 'View All Departments') {
            getData('departments_view');
        }

        if (choices === 'View All Employees By Department') {
            getData('emplyeeslistbydept_view');
        }

        if (choices === 'View All Roles') {
            getData('roles_view');
        }

        if (choices === 'View All Employees By Roles') {
            getData('employeelistbyrole_view');
        }

        if (choices === 'View All Employees By Manager') {
            getData('employesslistbymanager_view');
        }

        if (choices === 'View Unfulfilled Positions Roles') {
            getData('unfulfilledroles_view');
        }

        if (choices === 'View Employees Count By Role') {
            getData('empcountbyrole_view');
        }

        if (choices === 'View Employees Count By Department') {
            getData('empcountbydept_view');
        }

        if (choices === 'View Salary Metrics By Department') {
            getData('deptsalaryinsights_view');
        }      

        if (choices === 'Exit') {
            connection.end();
        }
  });
};


const getData = (tableName) => {
    let sql = `select * from ${tableName}`;
    connection.promise().query(sql, (error, response) => {
        if (error) throw error;
        log("                           ");
        log(
            chalk.white("===================================================================================="));
        log("                           ");
        console.table(response);
        log(chalk.white.bold(`====================================================================================`));
        log("                           ");
        promptUser();
    });
};
