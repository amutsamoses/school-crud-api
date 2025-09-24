module.exports = (sequelize, DataTypes) => {
  const Student = sequelize.define(
    "Student",
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      first_name: {
        type: DataTypes.STRING(50),
        allowNull: false,
      },
      last_name: {
        type: DataTypes.STRING(50),
        allowNull: false,
      },
      email: {
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true,
        validate: {
          isEmail: true,
        },
      },
      phone_number: {
        type: DataTypes.STRING(15),
      },
      date_of_birth: {
        type: DataTypes.DATEONLY,
      },
    },
    {
      tableName: "students",
      timestamps: true, // Sequelize automatically maps createdAt & updatedAt
      underscored: true, // Use snake_case for DB fields
    }
  );

  Student.associate = (models) => {
    Student.belongsToMany(models.Course, {
      through: models.Enrollment,
      foreignKey: "student_id",
    });
  };

  return Student;
};
