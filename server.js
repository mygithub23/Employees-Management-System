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
            
            allEmployees();

        }

        if (choices === 'View All Departments') {
            allDepartments();
      }

        if (choices === 'View All Employees By Department') {
            employeesListByDepartment();
        }

        if (choices === 'View All Roles') {
            allRoles();
        }

        if (choices === 'View All Employees By Roles') {
            employeesListByRole();
        }
        
        if (choices === 'View All Employees By Manager') {
            employeesListByManager();
        }

        if (choices === 'View Unfulfilled Positions Roles') {
            unfulfilledRoles();
        }

        if (choices === 'View Employees Count By Role') {
            employeesCountByRole();
        }

        if (choices === 'View Employees Count By Department') {
            employeesCountByDepartment();
        }

        if (choices === 'View Salary Metrics By Department') {
            currentSalryInsightByDepartment();
        }        

        if (choices === 'Exit') {
            connection.end();
        }
  });
};


const allEmployees = () => {
    let sql = `select * from employees_view`;
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

const allDepartments = () => {
    const sql = `SELECT * FROM departments_view`;
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


const allRoles = () => {
    const sql = `SELECT * FROM roles_view`
    connection.promise().query(sql, (error, response) => {
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




const employeesListByDepartment = () => {
    const sql = `SELECT * FROM emplyeeslistbydept_view`;
    connection.query(sql, (error, response) => {
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


const employeesListByRole = () => {
    const sql = `SELECT * FROM employeelistbyrole_view`;
    connection.query(sql, (error, response) => {
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

const employeesListByManager = () => {
    const sql = `SELECT * FROM employesslistbymanager_view`;
    connection.query(sql, (error, response) => {
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

const unfulfilledRoles = () => {
    const sql = `SELECT * FROM unfulfilledroles_view`;
    connection.query(sql, (error, response) => {
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

const employeesCountByRole = () => {
    const sql = `SELECT * FROM empcountbyrole_view`;
    connection.query(sql, (error, response) => {
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

const employeesCountByDepartment = () => {
    const sql = `SELECT * FROM empcountbydept_view`;
    connection.query(sql, (error, response) => {
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

const currentSalryInsightByDepartment = () => {
    const sql = `SELECT * FROM deptsalaryinsights_view`;
    connection.query(sql, (error, response) => {
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
